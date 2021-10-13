
import { Clarinet, Tx, Chain, Account, types } from 'https://deno.land/x/clarinet@v0.14.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

Clarinet.test({
    name: "Ensure that <...>",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        let deployerWallet = accounts.get("deployer") as Account;
        let wallet1 = accounts.get("wallet_1") as Account;
        let wallet2 = accounts.get("wallet_2") as Account;


        chain.mineEmptyBlockUntil(1);

        let block = chain.mineBlock([   
            Tx.contractCall(
                `bigger-random-number`,
                "set-vrf",
                [],
                deployerWallet.address
            ),
            Tx.contractCall(
                `bigger-random-number`,
                "get-byte-at",
                [types.uint(0)],
                deployerWallet.address
            ),
            // Tx.contractCall(
            //     `bigger-random-number`,
            //     "get-vrf",
            //     [],
            //     deployerWallet.address
            // ),
            // Tx.contractCall(
            //     `bigger-random-number`,
            //     "get-two-bytes",
            //     [],
            //     deployerWallet.address
            // ),
            // Tx.contractCall(
            //     `bigger-random-number`,
            //     "test-swap-container",
            //     [],
            //     deployerWallet.address
            // ),
            // Tx.contractCall(
            //     `bigger-random-number`,
            //     "get-random-id",
            //     [],
            //     deployerWallet.address
            // ),
        ]);
        console.log(block.receipts)
        // console.log(block.receipts[1].result)
        // console.log(block.receipts[2].result)
    },
});
