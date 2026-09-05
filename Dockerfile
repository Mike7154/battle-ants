# Battle Ants — served as a single static page via nginx.
# The game is one self-contained HTML file (no build step, no backend needed).
FROM nginx:alpine

# nginx's default server block serves /usr/share/nginx/html on port 80.
# The game file becomes index.html inside the image (the source file keeps its own name in git).
COPY ant-colony-battle-game_8.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s CMD wget -q -O- http://localhost/ || exit 1
