![Spacecoin Logo](https://i.imgur.com/jXUcvgy.png "Spacecoin Logo")

Run [Spacecoin](https://github.com/spaceworksco/spacecoin) daemon in a docker container.

### Quick start

1. Edit SPACE.conf with your configuration, if necessary.
2. Build `docker build -t spaceworksco/spacecoin . --file Dockerfile`
3. Run `docker run -it -v ~/.SPACE:/root/.komodo/SPACE spaceworksco/spacecoin`  
   (replace `~/.SPACE` with the path in your host in which you want to sync all your data)

### Useful commands

Visit the [Spacecoin RPC Docs](http://spacecoin-rpc.spaceworks.co) to see all of the commands available in `spacecoin-cli` or run `spacecoin-cli help`.

### What is Spacecoin ?

> *Spacecoin is a digital currency that can be used through the universe.*

### Resources

##### Spacecoin
   - https://spaceworks.co/spacecoin
   - https://twitter.com/SpacecoinSPACE
   - https://github.com/SpaceWorksCo/spacecoin


Thanks to [nail/docker-komodo](https://github.com/naei/docker-komodo)
