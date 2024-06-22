# Docker Compose Stack for Dockbox2 

## Quickstart

1. Run `make up` to start both the traefik_stack and web_docs stack.

``` shell
$ make up
docker compose -p traefik_stack -f docker-compose.yml up -d
[+] Running 6/6
 ✔ Container traefik      Started                                                                                                                                      3.4s 
 ✔ Container whoami       Started                                                                                                                                      3.2s 
 ✔ Container dockerproxy  Started                                                                                                                                      1.9s 
 ✔ Container portainer    Started                                                                                                                                      3.7s 
 ✔ Container cadvisor     Started                                                                                                                                      3.7s 
 ✔ Container uptime-kuma  Started                                                                                                                                      3.5s 
docker compose -p web_docs_stack --env-file .env -f web/docker-compose.yml up -d
[+] Running 1/2
 ⠙ Network web_docs_stack_default  Created                                                                                                                             1.2s 
 ✔ Container sphinx-docs           Started                                                                                                                             1.0s  ```
```

2. Browse to the various subdomains listed in the Subdomain  Mappings section, below.

## Stacks

There are 2 docker stacks:
- The Traefik Stack provides core infrastrucure.
- The Web Docs Stack is an example of otherwise unrelated services which are routed to by the Traefik service.

### Traefik Stack

- traefik as a reverse proxy
- whoami useful to show the routing is working
- dockerproxy prevents having to give other containers complete access to the docker socket. In this case it is Portainer, but other use cases are dockerized Prefect flows and Docker Swarm.
- portainer as a convenient Docker Web UI.
- cadvisor for container metrics 
- uptime-kuma for monitoring container up-time.

### Web Docs Stack

## Environment Variables.

An example `.env` file is included in the repository. It defines:

- The local network name.
- The domain name.
- The subdomains and where they map to.

The .env file path does have to be passed to the `docker compose` command so that the environmental variables can be found when executing compose files in subdirectories.

## Subdomain Mappings

traefik.dockbox2.sbs.ewqg.com   -> traefik. Verified
dashboard.dockbox2.sbs.ewqg.com -> portainer. Verified working. Temporary. Admin is intended for portainer.
uptime.dockbox2.sbs.ewqg.com    -> uptimekuma. Verified working.
staging.dockbox2.sbs.ewqg.com   -> whoami. Verified working.
testing.dockbox2.sbs.ewqg.com   -> nginx web server. Verified working.

### Possible DNS Routing Issues

admin.dockbox2.sbs.ewqg.com     -> Intended for portainer. Not verified. Possibly a DNS routing issue.
testing2.dockbox2.sbs.ewqg.com  -> Not used. Not available?