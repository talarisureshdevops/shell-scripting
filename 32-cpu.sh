#!/bin/bash

echo "Hello Suresh,

This is a test email from Linux Server.

Hostname: $(hostname)
Date: $(date)

Regards,
Shell Script" | s-nail \
-S mta=smtp://smtp.gmail.com:587 \
-S smtp-use-starttls \
-S smtp-auth=login \
-S smtp-auth-user="mailtosuresh.bi@gmail.com" \
-S smtp-auth-password="mnleitjuceybabab" \
-S from="mailtosuresh.bi@gmail.com" \
-s "Test Email from EC2" \
mailtosuresh.bi@gmail.com
