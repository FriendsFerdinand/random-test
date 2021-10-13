(define-constant MAX_MINT u100)
(define-map chosen-ids uint uint)
(define-data-var remaining uint u100)
(define-data-var current-block uint block-height)

(define-constant BUFF_TO_BYTE (list
    0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f
    0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 
    0x20 0x21 0x22 0x23 0x24 0x25 0x26 0x27 0x28 0x29 0x2a 0x2b 0x2c 0x2d 0x2e 0x2f
    0x30 0x31 0x32 0x33 0x34 0x35 0x36 0x37 0x38 0x39 0x3a 0x3b 0x3c 0x3d 0x3e 0x3f
    0x40 0x41 0x42 0x43 0x44 0x45 0x46 0x47 0x48 0x49 0x4a 0x4b 0x4c 0x4d 0x4e 0x4f
    0x50 0x51 0x52 0x53 0x54 0x55 0x56 0x57 0x58 0x59 0x5a 0x5b 0x5c 0x5d 0x5e 0x5f 
    0x60 0x61 0x62 0x63 0x64 0x65 0x66 0x67 0x68 0x69 0x6a 0x6b 0x6c 0x6d 0x6e 0x6f
    0x70 0x71 0x72 0x73 0x74 0x75 0x76 0x77 0x78 0x79 0x7a 0x7b 0x7c 0x7d 0x7e 0x7f
    0x80 0x81 0x82 0x83 0x84 0x85 0x86 0x87 0x88 0x89 0x8a 0x8b 0x8c 0x8d 0x8e 0x8f
    0x90 0x91 0x92 0x93 0x94 0x95 0x96 0x97 0x98 0x99 0x9a 0x9b 0x9c 0x9d 0x9e 0x9f
    0xa0 0xa1 0xa2 0xa3 0xa4 0xa5 0xa6 0xa7 0xa8 0xa9 0xaa 0xab 0xac 0xad 0xae 0xaf
    0xb0 0xb1 0xb2 0xb3 0xb4 0xb5 0xb6 0xb7 0xb8 0xb9 0xba 0xbb 0xbc 0xbd 0xbe 0xbf 
    0xc0 0xc1 0xc2 0xc3 0xc4 0xc5 0xc6 0xc7 0xc8 0xc9 0xca 0xcb 0xcc 0xcd 0xce 0xcf 
    0xd0 0xd1 0xd2 0xd3 0xd4 0xd5 0xd6 0xd7 0xd8 0xd9 0xda 0xdb 0xdc 0xdd 0xde 0xdf 
    0xe0 0xe1 0xe2 0xe3 0xe4 0xe5 0xe6 0xe7 0xe8 0xe9 0xea 0xeb 0xec 0xed 0xee 0xef
    0xf0 0xf1 0xf2 0xf3 0xf4 0xf5 0xf6 0xf7 0xf8 0xf9 0xfa 0xfb 0xfc 0xfd 0xfe 0xff
))

(define-data-var TWO_FOLDS (list 64 bool)
    (list
        true true 
    )
)

;; THIS IS ONLY FOR TESTING
;; THE REGTEST CHANGES ITS VRF AT EVERY get-block-info? CALL
;; (define-public (set-vrf)
    ;; (ok (var-set vrf (unwrap-panic (get-block-info? vrf-seed (- block-height u1)))))
;;     (ok (var-set vrf 0x011cb2f154711d494c036e965bf3ef70f9619411a517edc481f5d5a9e6b1c046))
;; )

(define-read-only (get-vrf)
    (sha512 (unwrap-panic (get-block-info? vrf-seed (- block-height u1))))
)

(define-read-only (get-two-bytes)
    (get acc (fold concat-iter (var-get TWO_FOLDS) {acc: 0x, idx: u0, full: (get-vrf) }))
)

(define-private (concat-iter (ignore bool) (output {acc: (buff 2), idx: uint, full: (buff 64)}))
    (if ignore
        {
            acc: (unwrap-panic (as-max-len? (concat (get acc output) (unwrap-panic (element-at  (get full output) (get idx output)))) u2)),
            idx: (+ (get idx output) u1),
            full:  (get full output)
        }
        {
            acc:  (get acc output),
            idx: (+ (get idx output) u1),
            full:  (get full output)
        } 
    )
)

(define-read-only (get-random-number)
    (sum-bytes (get-two-bytes))
)

(define-read-only (sum-bytes (bytes (buff 2)))
    (+ 
        (* (unwrap-panic (index-of BUFF_TO_BYTE (unwrap-panic (element-at bytes u0)))) u256)
        (unwrap-panic (index-of BUFF_TO_BYTE (unwrap-panic (element-at bytes u1))))
    )
)

(define-read-only (get-container-at (idx uint))
    (begin
        (match (map-get? chosen-ids idx)
            result_id {chosen-idx: idx, chosen-id: (some result_id)}
            {chosen-idx: idx, chosen-id: none}
        )
    )
)

(define-public (swap-container (container (tuple (chosen-id (optional uint)) (chosen-idx uint))))
    (let (
            (top (- (var-get remaining) u1))
            (id-to-swap (default-to (get chosen-idx container) (get chosen-id container)))
            (top-container (get-container-at top))
        )
        (map-set chosen-ids top id-to-swap)
        (map-set chosen-ids (get chosen-idx container) (default-to top (get chosen-id top-container)))
        (ok (var-set remaining top))
    )
)

(define-private (get-random-id)
    (let ((picked-container (get-container-at (mod (get-random-number) (var-get remaining)))))
        (unwrap-panic (swap-container picked-container))
        (default-to (get chosen-idx picked-container) (get chosen-id picked-container))
    )
)

(define-private (cycle-id)
    (var-set TWO_FOLDS (unwrap-panic (as-max-len? (concat (list false false) (var-get TWO_FOLDS)) u64)))
)

(define-public (mint)
    (begin
        (asserts! (> (var-get remaining) u0) (err u501)) ;; no more NFTs!
        (let ((random-id (get-random-id)))
            (if (is-eq (var-get current-block) block-height) ;; we are still in the same block
                (begin
                    (asserts! (not (is-eq (len (var-get TWO_FOLDS)) u64)) (err u502)) ;; we have reached block limit, try next block
                    ;; you mint here with (nft-mint? NFT random-id tx-sender)
                    (cycle-id)
                    (ok random-id)
                )
                (begin ;; we are entering new block
                    (var-set current-block block-height)
                    (var-set TWO_FOLDS (list true true)) ;; restart from the beginning
                    ;; you mint here with  (nft-mint? NFT random-id tx-sender)
                    (cycle-id)
                    (ok random-id)
                )
            )
        )
    )
)
