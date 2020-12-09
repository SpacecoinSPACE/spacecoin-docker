![Spacecoin Logo](https://i.imgur.com/jXUcvgy.png "Spacecoin Logo")

Run [Spacecoin](https://github.com/spaceworksco/spacecoin) daemon in a docker container.

### Quick start

1. Build `docker build -t spaceworksco/spacecoin . --file Dockerfile`
2. Run `docker run -it -v ~/.SPACE:/root/.komodo/SPACE spaceworksco/spacecoin`

If you'd like to add a custom SPACE.conf file, place it in the /root/.komodo/SPACE directory.

### Useful commands

Visit the [Spacecoin RPC Docs](http://spacecoin-rpc.spaceworks.co) to see all of the commands available in `spacecoin-cli` or run `spacecoin-cli help`.

### What is Spacecoin ?

> *Spacecoin is a digital currency that can be used through the universe.*

### Resources

##### Spacecoin
   - https://spaceworks.co/spacecoin
   - https://twitter.com/SpacecoinSPACE
   - https://github.com/SpaceWorksCo/spacecoin
   - https://spaceworks.co/discord
   - https://spaceworks.co/telegram


Thanks to [naei/docker-komodo](https://github.com/naei/docker-komodo)
