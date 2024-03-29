
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
                `random-number`,
                "get-vrf",
                [],
                deployerWallet.address
            ),
            Tx.contractCall(
                `random-number`,
                "get-byte-at",
                [types.uint(0)],
                deployerWallet.address
            ),
            Tx.contractCall(
                `random-number`,
                "get-uint-at",
                [types.uint(0)],
                deployerWallet.address
            )
        ]);

        let nums: any[] = [];
        for(let i = 0; i < 100; i++) {
            block = chain.mineBlock([   
                Tx.contractCall(
                    `random-number`,
                    "mint",
                    [],
                    deployerWallet.address
                )
            ]);
            // nums.push(block.receipts[0].result.)
            console.log(block.receipts[0].result);
            // nums.push(block.receipts[0].result.expectOk());
            
            // if (nums.indexOf(block.receipts[0].result.expectOk()) !=1! -1) {
            //     console.log("NOOOO");
            // } else {
            //     nums.push(block.receipts[0].result.expectOk())
            // }
        }

        for(let i = 0; i < 100; i++) {
            block = chain.mineBlock([   
                Tx.contractCall(
                    `random-number`,
                    "get-owner",
                    [types.uint(i)],
                    deployerWallet.address
                )
            ]);
            console.log(block.receipts[0].result)
        }
        
    },
});
