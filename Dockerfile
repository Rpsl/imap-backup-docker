FROM ruby:3-slim

RUN gem install 'imap-backup'

COPY exec.sh /app/

CMD ["bash", "/app/exec.sh"]