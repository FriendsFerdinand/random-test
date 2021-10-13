(define-data-var vrf (buff 32) 0x)

(define-map chosen-ids uint uint)
(define-data-var remaining uint u50)

(define-map BUFF_TO_STR
    (buff 1)
    (string-ascii 2)
)

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

(define-constant BYTE_TO_STR (list
    "0x00" "0x01" "0x02" "0x03" "0x04" "0x05" "0x06" "0x07" "0x08" "0x09" "0x0a" "0x0b" "0x0c" "0x0d" "0x0e" "0x0f"
    "0x10" "0x11" "0x12" "0x13" "0x14" "0x15" "0x16" "0x17" "0x18" "0x19" "0x1a" "0x1b" "0x1c" "0x1d" "0x1e" "0x1f" 
    "0x20" "0x21" "0x22" "0x23" "0x24" "0x25" "0x26" "0x27" "0x28" "0x29" "0x2a" "0x2b" "0x2c" "0x2d" "0x2e" "0x2f"
    "0x30" "0x31" "0x32" "0x33" "0x34" "0x35" "0x36" "0x37" "0x38" "0x39" "0x3a" "0x3b" "0x3c" "0x3d" "0x3e" "0x3f"
    "0x40" "0x41" "0x42" "0x43" "0x44" "0x45" "0x46" "0x47" "0x48" "0x49" "0x4a" "0x4b" "0x4c" "0x4d" "0x4e" "0x4f"
    "0x50" "0x51" "0x52" "0x53" "0x54" "0x55" "0x56" "0x57" "0x58" "0x59" "0x5a" "0x5b" "0x5c" "0x5d" "0x5e" "0x5f" 
    "0x60" "0x61" "0x62" "0x63" "0x64" "0x65" "0x66" "0x67" "0x68" "0x69" "0x6a" "0x6b" "0x6c" "0x6d" "0x6e" "0x6f"
    "0x70" "0x71" "0x72" "0x73" "0x74" "0x75" "0x76" "0x77" "0x78" "0x79" "0x7a" "0x7b" "0x7c" "0x7d" "0x7e" "0x7f"
    "0x80" "0x81" "0x82" "0x83" "0x84" "0x85" "0x86" "0x87" "0x88" "0x89" "0x8a" "0x8b" "0x8c" "0x8d" "0x8e" "0x8f"
    "0x90" "0x91" "0x92" "0x93" "0x94" "0x95" "0x96" "0x97" "0x98" "0x99" "0x9a" "0x9b" "0x9c" "0x9d" "0x9e" "0x9f"
    "0xa0" "0xa1" "0xa2" "0xa3" "0xa4" "0xa5" "0xa6" "0xa7" "0xa8" "0xa9" "0xaa" "0xab" "0xac" "0xad" "0xae" "0xaf"
    "0xb0" "0xb1" "0xb2" "0xb3" "0xb4" "0xb5" "0xb6" "0xb7" "0xb8" "0xb9" "0xba" "0xbb" "0xbc" "0xbd" "0xbe" "0xbf" 
    "0xc0" "0xc1" "0xc2" "0xc3" "0xc4" "0xc5" "0xc6" "0xc7" "0xc8" "0xc9" "0xca" "0xcb" "0xcc" "0xcd" "0xce" "0xcf" 
    "0xd0" "0xd1" "0xd2" "0xd3" "0xd4" "0xd5" "0xd6" "0xd7" "0xd8" "0xd9" "0xda" "0xdb" "0xdc" "0xdd" "0xde" "0xdf" 
    "0xe0" "0xe1" "0xe2" "0xe3" "0xe4" "0xe5" "0xe6" "0xe7" "0xe8" "0xe9" "0xea" "0xeb" "0xec" "0xed" "0xee" "0xef"
    "0xf0" "0xf1" "0xf2" "0xf3" "0xf4" "0xf5" "0xf6" "0xf7" "0xf8" "0xf9" "0xfa" "0xfb" "0xfc" "0xfd" "0xfe" "0xff"
))

(define-constant DIGIT_TO_UINT (list
    "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f"
))

(define-constant TWO_FOLDS (list
    u0 u1
))

;; THIS IS ONLY FOR TESTING
;; THE REGTEST CHANGES ITS VRF AT EVERY get-block-info? CALL
(define-public (set-vrf)
    ;; (ok (var-set vrf (unwrap-panic (get-block-info? vrf-seed (- block-height u1)))))
    (ok (var-set vrf 0x011cb2f154711d494c036e965bf3ef70f9619411a517edc481f5d5a9e6b1c046))
)

(define-read-only (get-vrf)
    (var-get vrf)
    ;; (unwrap-panic
    ;;     (get-block-info? vrf-seed (- block-height u1))
    ;; )
)

(define-read-only (get-byte-at (pos uint))
    (unwrap-panic
        (element-at (get-vrf) pos)
    )
)

(define-read-only (get-uint-from-byte (index uint))
    (index-of BUFF_TO_BYTE (get-byte-at index))
)

(define-read-only (get-two-bytes)
    (get acc (fold add-digits (byte-to-str (fold concat-vrf TWO_FOLDS 0x)) {acc: u0, idx: u4} ))
)

(define-read-only (byte-to-str (bytes (buff 2)))
    (fold byte-to-str-iter bytes "")
)

(define-private (byte-to-str-iter (byte (buff 1)) (output (string-ascii 32)))
    (unwrap-panic (as-max-len? (concat output (unwrap-panic (map-get? BUFF_TO_STR byte))) u32))
)

(define-private (concat-vrf (index uint) (output (buff 2)))
    (unwrap-panic (as-max-len? (concat output (get-byte-at index)) u2))
)

(define-read-only (add-digits (digit (string-ascii 1)) (output {acc: uint, idx: uint}))
    {
        idx: (- (get idx output) u1),
        acc: (+ (get acc output) (* (unwrap-panic (index-of DIGIT_TO_UINT digit)) (pow u16 (- (get idx output) u1) )))
    }
)

(define-read-only (get-container-at (idx uint))
    (begin
        (match (map-get? chosen-ids idx) ;; grab biggest
            result_id {chosen-idx: idx, chosen-id: (some result_id)}
            {chosen-idx: idx, chosen-id: none}
        )
    )
)

(define-public (test-swap-container)
    (swap-container {chosen-id: none, chosen-idx: u8})
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

(define-public (get-random-id)
    (let ((picked-container (get-container-at (mod (get-two-bytes) (var-get remaining)))))
        (unwrap-panic (swap-container picked-container))
        (ok (default-to (get chosen-idx picked-container) (get chosen-id picked-container)))
    )
)

;; (define-public (set-map-data)
;; (begin
;;     (map-insert BUFF_TO_STR 0x00 "00")
;; (map-insert BUFF_TO_STR 0x01 "01")
;; (map-insert BUFF_TO_STR 0x02 "02")
;; (map-insert BUFF_TO_STR 0x03 "03")
;; (map-insert BUFF_TO_STR 0x04 "04")
;; (map-insert BUFF_TO_STR 0x05 "05")
;; (map-insert BUFF_TO_STR 0x06 "06")
;; (map-insert BUFF_TO_STR 0x07 "07")
;; (map-insert BUFF_TO_STR 0x08 "08")
;; (map-insert BUFF_TO_STR 0x09 "09")
;; (map-insert BUFF_TO_STR 0x0a "0a")
;; (map-insert BUFF_TO_STR 0x0b "0b")
;; (map-insert BUFF_TO_STR 0x0c "0c")
;; (map-insert BUFF_TO_STR 0x0d "0d")
;; (map-insert BUFF_TO_STR 0x0e "0e")
;; (map-insert BUFF_TO_STR 0x0f "0f")


;; (map-insert BUFF_TO_STR 0x10 "10")
;; (map-insert BUFF_TO_STR 0x11 "11")
;; (map-insert BUFF_TO_STR 0x12 "12")
;; (map-insert BUFF_TO_STR 0x13 "13")
;; (map-insert BUFF_TO_STR 0x14 "14")
;; (map-insert BUFF_TO_STR 0x15 "15")
;; (map-insert BUFF_TO_STR 0x16 "16")
;; (map-insert BUFF_TO_STR 0x17 "17")
;; (map-insert BUFF_TO_STR 0x18 "18")
;; (map-insert BUFF_TO_STR 0x19 "19")
;; (map-insert BUFF_TO_STR 0x1a "1a")
;; (map-insert BUFF_TO_STR 0x1b "1b")
;; (map-insert BUFF_TO_STR 0x1c "1c")
;; (map-insert BUFF_TO_STR 0x1d "1d")
;; (map-insert BUFF_TO_STR 0x1e "1e")
;; (map-insert BUFF_TO_STR 0x1f "1f")


;; (map-insert BUFF_TO_STR 0x20 "20")
;; (map-insert BUFF_TO_STR 0x21 "21")
;; (map-insert BUFF_TO_STR 0x22 "22")
;; (map-insert BUFF_TO_STR 0x23 "23")
;; (map-insert BUFF_TO_STR 0x24 "24")
;; (map-insert BUFF_TO_STR 0x25 "25")
;; (map-insert BUFF_TO_STR 0x26 "26")
;; (map-insert BUFF_TO_STR 0x27 "27")
;; (map-insert BUFF_TO_STR 0x28 "28")
;; (map-insert BUFF_TO_STR 0x29 "29")
;; (map-insert BUFF_TO_STR 0x2a "2a")
;; (map-insert BUFF_TO_STR 0x2b "2b")
;; (map-insert BUFF_TO_STR 0x2c "2c")
;; (map-insert BUFF_TO_STR 0x2d "2d")
;; (map-insert BUFF_TO_STR 0x2e "2e")
;; (map-insert BUFF_TO_STR 0x2f "2f")


;; (map-insert BUFF_TO_STR 0x30 "30")
;; (map-insert BUFF_TO_STR 0x31 "31")
;; (map-insert BUFF_TO_STR 0x32 "32")
;; (map-insert BUFF_TO_STR 0x33 "33")
;; (map-insert BUFF_TO_STR 0x34 "34")
;; (map-insert BUFF_TO_STR 0x35 "35")
;; (map-insert BUFF_TO_STR 0x36 "36")
;; (map-insert BUFF_TO_STR 0x37 "37")
;; (map-insert BUFF_TO_STR 0x38 "38")
;; (map-insert BUFF_TO_STR 0x39 "39")
;; (map-insert BUFF_TO_STR 0x3a "3a")
;; (map-insert BUFF_TO_STR 0x3b "3b")
;; (map-insert BUFF_TO_STR 0x3c "3c")
;; (map-insert BUFF_TO_STR 0x3d "3d")
;; (map-insert BUFF_TO_STR 0x3e "3e")
;; (map-insert BUFF_TO_STR 0x3f "3f")


;; (map-insert BUFF_TO_STR 0x40 "40")
;; (map-insert BUFF_TO_STR 0x41 "41")
;; (map-insert BUFF_TO_STR 0x42 "42")
;; (map-insert BUFF_TO_STR 0x43 "43")
;; (map-insert BUFF_TO_STR 0x44 "44")
;; (map-insert BUFF_TO_STR 0x45 "45")
;; (map-insert BUFF_TO_STR 0x46 "46")
;; (map-insert BUFF_TO_STR 0x47 "47")
;; (map-insert BUFF_TO_STR 0x48 "48")
;; (map-insert BUFF_TO_STR 0x49 "49")
;; (map-insert BUFF_TO_STR 0x4a "4a")
;; (map-insert BUFF_TO_STR 0x4b "4b")
;; (map-insert BUFF_TO_STR 0x4c "4c")
;; (map-insert BUFF_TO_STR 0x4d "4d")
;; (map-insert BUFF_TO_STR 0x4e "4e")
;; (map-insert BUFF_TO_STR 0x4f "4f")


;; (map-insert BUFF_TO_STR 0x50 "50")
;; (map-insert BUFF_TO_STR 0x51 "51")
;; (map-insert BUFF_TO_STR 0x52 "52")
;; (map-insert BUFF_TO_STR 0x53 "53")
;; (map-insert BUFF_TO_STR 0x54 "54")
;; (map-insert BUFF_TO_STR 0x55 "55")
;; (map-insert BUFF_TO_STR 0x56 "56")
;; (map-insert BUFF_TO_STR 0x57 "57")
;; (map-insert BUFF_TO_STR 0x58 "58")
;; (map-insert BUFF_TO_STR 0x59 "59")
;; (map-insert BUFF_TO_STR 0x5a "5a")
;; (map-insert BUFF_TO_STR 0x5b "5b")
;; (map-insert BUFF_TO_STR 0x5c "5c")
;; (map-insert BUFF_TO_STR 0x5d "5d")
;; (map-insert BUFF_TO_STR 0x5e "5e")
;; (map-insert BUFF_TO_STR 0x5f "5f")


;; (map-insert BUFF_TO_STR 0x60 "10")
;; (map-insert BUFF_TO_STR 0x61 "11")
;; (map-insert BUFF_TO_STR 0x62 "12")
;; (map-insert BUFF_TO_STR 0x63 "13")
;; (map-insert BUFF_TO_STR 0x64 "14")
;; (map-insert BUFF_TO_STR 0x65 "15")
;; (map-insert BUFF_TO_STR 0x66 "16")
;; (map-insert BUFF_TO_STR 0x67 "17")
;; (map-insert BUFF_TO_STR 0x68 "18")
;; (map-insert BUFF_TO_STR 0x69 "19")
;; (map-insert BUFF_TO_STR 0x6a "1a")
;; (map-insert BUFF_TO_STR 0x6b "1b")
;; (map-insert BUFF_TO_STR 0x6c "1c")
;; (map-insert BUFF_TO_STR 0x6d "1d")
;; (map-insert BUFF_TO_STR 0x6e "1e")
;; (map-insert BUFF_TO_STR 0x6f "1f")


;; (map-insert BUFF_TO_STR 0x70 "70")
;; (map-insert BUFF_TO_STR 0x71 "71")
;; (map-insert BUFF_TO_STR 0x72 "72")
;; (map-insert BUFF_TO_STR 0x73 "73")
;; (map-insert BUFF_TO_STR 0x74 "74")
;; (map-insert BUFF_TO_STR 0x75 "75")
;; (map-insert BUFF_TO_STR 0x76 "76")
;; (map-insert BUFF_TO_STR 0x77 "77")
;; (map-insert BUFF_TO_STR 0x78 "78")
;; (map-insert BUFF_TO_STR 0x79 "79")
;; (map-insert BUFF_TO_STR 0x7a "7a")
;; (map-insert BUFF_TO_STR 0x7b "7b")
;; (map-insert BUFF_TO_STR 0x7c "7c")
;; (map-insert BUFF_TO_STR 0x7d "7d")
;; (map-insert BUFF_TO_STR 0x7e "7e")
;; (map-insert BUFF_TO_STR 0x7f "7f")


;; (map-insert BUFF_TO_STR 0x70 "70")
;; (map-insert BUFF_TO_STR 0x71 "71")
;; (map-insert BUFF_TO_STR 0x72 "72")
;; (map-insert BUFF_TO_STR 0x73 "73")
;; (map-insert BUFF_TO_STR 0x74 "74")
;; (map-insert BUFF_TO_STR 0x75 "75")
;; (map-insert BUFF_TO_STR 0x76 "76")
;; (map-insert BUFF_TO_STR 0x77 "77")
;; (map-insert BUFF_TO_STR 0x78 "78")
;; (map-insert BUFF_TO_STR 0x79 "79")
;; (map-insert BUFF_TO_STR 0x7a "7a")
;; (map-insert BUFF_TO_STR 0x7b "7b")
;; (map-insert BUFF_TO_STR 0x7c "7c")
;; (map-insert BUFF_TO_STR 0x7d "7d")
;; (map-insert BUFF_TO_STR 0x7e "7e")
;; (map-insert BUFF_TO_STR 0x7f "7f")


;; (map-insert BUFF_TO_STR 0x80 "80")
;; (map-insert BUFF_TO_STR 0x81 "81")
;; (map-insert BUFF_TO_STR 0x82 "82")
;; (map-insert BUFF_TO_STR 0x83 "83")
;; (map-insert BUFF_TO_STR 0x84 "84")
;; (map-insert BUFF_TO_STR 0x85 "85")
;; (map-insert BUFF_TO_STR 0x86 "86")
;; (map-insert BUFF_TO_STR 0x87 "87")
;; (map-insert BUFF_TO_STR 0x88 "88")
;; (map-insert BUFF_TO_STR 0x89 "89")
;; (map-insert BUFF_TO_STR 0x8a "8a")
;; (map-insert BUFF_TO_STR 0x8b "8b")
;; (map-insert BUFF_TO_STR 0x8c "8c")
;; (map-insert BUFF_TO_STR 0x8d "8d")
;; (map-insert BUFF_TO_STR 0x8e "8e")
;; (map-insert BUFF_TO_STR 0x8f "8f")


;; (map-insert BUFF_TO_STR 0x90 "90")
;; (map-insert BUFF_TO_STR 0x91 "91")
;; (map-insert BUFF_TO_STR 0x92 "92")
;; (map-insert BUFF_TO_STR 0x93 "93")
;; (map-insert BUFF_TO_STR 0x94 "94")
;; (map-insert BUFF_TO_STR 0x95 "95")
;; (map-insert BUFF_TO_STR 0x96 "96")
;; (map-insert BUFF_TO_STR 0x97 "97")
;; (map-insert BUFF_TO_STR 0x98 "98")
;; (map-insert BUFF_TO_STR 0x99 "99")
;; (map-insert BUFF_TO_STR 0x9a "9a")
;; (map-insert BUFF_TO_STR 0x9b "9b")
;; (map-insert BUFF_TO_STR 0x9c "9c")
;; (map-insert BUFF_TO_STR 0x9d "9d")
;; (map-insert BUFF_TO_STR 0x9e "9e")
;; (map-insert BUFF_TO_STR 0x9f "9f")


;; (map-insert BUFF_TO_STR 0xa0 "a0")
;; (map-insert BUFF_TO_STR 0xa1 "a1")
;; (map-insert BUFF_TO_STR 0xa2 "a2")
;; (map-insert BUFF_TO_STR 0xa3 "a3")
;; (map-insert BUFF_TO_STR 0xa4 "a4")
;; (map-insert BUFF_TO_STR 0xa5 "a5")
;; (map-insert BUFF_TO_STR 0xa6 "a6")
;; (map-insert BUFF_TO_STR 0xa7 "a7")
;; (map-insert BUFF_TO_STR 0xa8 "a8")
;; (map-insert BUFF_TO_STR 0xa9 "a9")
;; (map-insert BUFF_TO_STR 0xaa "aa")
;; (map-insert BUFF_TO_STR 0xab "ab")
;; (map-insert BUFF_TO_STR 0xac "ac")
;; (map-insert BUFF_TO_STR 0xad "ad")
;; (map-insert BUFF_TO_STR 0xae "ae")
;; (map-insert BUFF_TO_STR 0xaf "af")


;; (map-insert BUFF_TO_STR 0xb0 "b0")
;; (map-insert BUFF_TO_STR 0xb1 "b1")
;; (map-insert BUFF_TO_STR 0xb2 "b2")
;; (map-insert BUFF_TO_STR 0xb3 "b3")
;; (map-insert BUFF_TO_STR 0xb4 "b4")
;; (map-insert BUFF_TO_STR 0xb5 "b5")
;; (map-insert BUFF_TO_STR 0xb6 "b6")
;; (map-insert BUFF_TO_STR 0xb7 "b7")
;; (map-insert BUFF_TO_STR 0xb8 "b8")
;; (map-insert BUFF_TO_STR 0xb9 "b9")
;; (map-insert BUFF_TO_STR 0xba "ba")
;; (map-insert BUFF_TO_STR 0xbb "bb")
;; (map-insert BUFF_TO_STR 0xbc "bc")
;; (map-insert BUFF_TO_STR 0xbd "bd")
;; (map-insert BUFF_TO_STR 0xbe "be")
;; (map-insert BUFF_TO_STR 0xbf "bf")


;; (map-insert BUFF_TO_STR 0xc0 "c0")
;; (map-insert BUFF_TO_STR 0xc1 "c1")
;; (map-insert BUFF_TO_STR 0xc2 "c2")
;; (map-insert BUFF_TO_STR 0xc3 "c3")
;; (map-insert BUFF_TO_STR 0xc4 "c4")
;; (map-insert BUFF_TO_STR 0xc5 "c5")
;; (map-insert BUFF_TO_STR 0xc6 "c6")
;; (map-insert BUFF_TO_STR 0xc7 "c7")
;; (map-insert BUFF_TO_STR 0xc8 "c8")
;; (map-insert BUFF_TO_STR 0xc9 "c9")
;; (map-insert BUFF_TO_STR 0xca "ca")
;; (map-insert BUFF_TO_STR 0xcb "cb")
;; (map-insert BUFF_TO_STR 0xcc "cc")
;; (map-insert BUFF_TO_STR 0xcd "cd")
;; (map-insert BUFF_TO_STR 0xce "ce")
;; (map-insert BUFF_TO_STR 0xcf "cf")


;; (map-insert BUFF_TO_STR 0xd0 "d0")
;; (map-insert BUFF_TO_STR 0xd1 "d1")
;; (map-insert BUFF_TO_STR 0xd2 "d2")
;; (map-insert BUFF_TO_STR 0xd3 "d3")
;; (map-insert BUFF_TO_STR 0xd4 "d4")
;; (map-insert BUFF_TO_STR 0xd5 "d5")
;; (map-insert BUFF_TO_STR 0xd6 "d6")
;; (map-insert BUFF_TO_STR 0xd7 "d7")
;; (map-insert BUFF_TO_STR 0xd8 "d8")
;; (map-insert BUFF_TO_STR 0xd9 "d9")
;; (map-insert BUFF_TO_STR 0xda "da")
;; (map-insert BUFF_TO_STR 0xdb "db")
;; (map-insert BUFF_TO_STR 0xdc "dc")
;; (map-insert BUFF_TO_STR 0xdd "dd")
;; (map-insert BUFF_TO_STR 0xde "de")
;; (map-insert BUFF_TO_STR 0xdf "df")



;; (map-insert BUFF_TO_STR 0xe0 "e0")
;; (map-insert BUFF_TO_STR 0xe1 "e1")
;; (map-insert BUFF_TO_STR 0xe2 "e2")
;; (map-insert BUFF_TO_STR 0xe3 "e3")
;; (map-insert BUFF_TO_STR 0xe4 "e4")
;; (map-insert BUFF_TO_STR 0xe5 "e5")
;; (map-insert BUFF_TO_STR 0xe6 "e6")
;; (map-insert BUFF_TO_STR 0xe7 "e7")
;; (map-insert BUFF_TO_STR 0xe8 "e8")
;; (map-insert BUFF_TO_STR 0xe9 "e9")
;; (map-insert BUFF_TO_STR 0xea "ea")
;; (map-insert BUFF_TO_STR 0xeb "eb")
;; (map-insert BUFF_TO_STR 0xec "ec")
;; (map-insert BUFF_TO_STR 0xed "ed")
;; (map-insert BUFF_TO_STR 0xee "ee")
;; (map-insert BUFF_TO_STR 0xef "ef")


;; (map-insert BUFF_TO_STR 0xf0 "f0")
;; (map-insert BUFF_TO_STR 0xf1 "f1")
;; (map-insert BUFF_TO_STR 0xf2 "f2")
;; (map-insert BUFF_TO_STR 0xf3 "f3")
;; (map-insert BUFF_TO_STR 0xf4 "f4")
;; (map-insert BUFF_TO_STR 0xf5 "f5")
;; (map-insert BUFF_TO_STR 0xf6 "f6")
;; (map-insert BUFF_TO_STR 0xf7 "f7")
;; (map-insert BUFF_TO_STR 0xf8 "f8")
;; (map-insert BUFF_TO_STR 0xf9 "f9")
;; (map-insert BUFF_TO_STR 0xfa "fa")
;; (map-insert BUFF_TO_STR 0xfb "fb")
;; (map-insert BUFF_TO_STR 0xfc "fc")
;; (map-insert BUFF_TO_STR 0xfd "fd")
;; (map-insert BUFF_TO_STR 0xfe "fe")
;; (map-insert BUFF_TO_STR 0xff "ff")
;; (ok true)
;; ))

;; (set-map-data)