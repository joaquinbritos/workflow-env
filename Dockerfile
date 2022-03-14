FROM dockercloud/hello-world


LABEL maintainer="joaquin.britos@dinoconsulting.com"

ADD index.php /www/index.php
ADD logo.png /www/logo.png