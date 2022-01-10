import bdkpython as bdk


descriptor = "wpkh(tprv8ZgxMBicQKsPcx5nBGsR63Pe8KnRUqmbJNENAfGftF3yuXoMMoVJJcYeUw5eVkm9WBPjWYt6HMWYJNesB5HaNVBaFc1M6dRjWSYnmewUMYy/84h/1h/0h/0/*)"
config = bdk.DatabaseConfig.MEMORY("")

wallet = bdk.OfflineWallet(descriptor, bdk.Network.TESTNET, config)
address = wallet.get_new_address()

print(f"New BIP84 testnet address: {address}")