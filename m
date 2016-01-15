Return-Path: <dja@axtens.net>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7B8601A028C
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 11:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=JDp56u+n; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id e65so7942764pfe.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 16:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-type;
 bh=y3TsAla7g15EAPG0wHiZ7ylValb8KHVozjk+SlsPXnQ=;
 b=JDp56u+n4NK3fK2Sw0x0VA4628RcBdtM9/Lt2z/iTJPrWBYzwZDBQONhMqAZcJ5tRY
 i25JoD5tA7fPheV5o7+ucJIa1tSNd1N8dXSaaQR/P4UKOduyRCR/AN3aqxWm94ruVDm0
 oIEqQJ+eepXR0dO2iaA6EE8U46xRcHiB/vNos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=y3TsAla7g15EAPG0wHiZ7ylValb8KHVozjk+SlsPXnQ=;
 b=Ahrj1zviJolRGSgLmwiz8hbb3asrEe65NrpYkntw+LhkGbRI/JHBz6JQmckjQTd7fa
 l4MsYs6TccE4sB3UVdSlRVWN8X4x8ctZYl2c0VTh2sH9RIvy6GU2rT+T5WbYrWzSybUj
 J9t8uuiAmWJ+KQFuWv6XVVxb5KdvbnHOoFApNIY9mFQBLly4VFC+l3/XUgCjOB95ETgh
 cjvjHNyV3p6H/GqGpA4ip/411zhCgTtHfDXM9PDh1rsQAEAeQquBrTxFMKRoHejNUYDp
 0Iu5gQXeGoMyyHKJAfCqenMtyPsMx+D/5EktQ2W88KC19f59XJlscexDemr+y0l+Ovea
 nSuA==
X-Gm-Message-State: ALoCoQlClJF0oxlHsCIB+Faruy1r0IZTTg0nwvZbS7PXCee+vxXJmG5Ow5SbrZqCNP15tQzLoi7WPDsDSPpFFXOoRMITqaxI/Q==
X-Received: by 10.98.93.136 with SMTP id n8mr10528683pfj.88.1452816923247;
 Thu, 14 Jan 2016 16:15:23 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i76sm11691338pfj.68.2016.01.14.16.15.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2016 16:15:22 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: Re: [PATCH btbridge 3/3] Initial set of test.
In-Reply-To: <1452750607-27095-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452750607-27095-4-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Fri, 15 Jan 2016 11:15:19 +1100
Message-ID: <87io2v4s14.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jan 2016 00:15:26 -0000

Hi Cyril,

> Very simple tests which can hopefully be extended in the future.

Yay for tests!

A little bit of explanation of the various bits would have been nice.

> diff --git a/.build.sh b/.build.sh
> index 79b0b5c..e762a85 100755
> --- a/.build.sh
> +++ b/.build.sh
> @@ -1,9 +1,11 @@
>  #!/bin/bash
> +set -evx
Did you intend this line to make it past debugging and into your commit?
>  
>  Dockerfile=$(cat << EOF
>  FROM ubuntu:15.10
>  RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
>  RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> +RUN mkdir /var/run/dbus
>  RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
>  USER ${USER}
>  ENV HOME ${HOME}
> @@ -14,6 +16,9 @@ EOF
>  docker pull ubuntu:15.10
>  docker build -t temp - <<< "${Dockerfile}"
>  
> +sudo cp .org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.d/org.openbmc.HostIpmi.conf
> +sudo service dbus restart
> +
>  gcc --version
>  
>  mkdir -p linux
> @@ -21,3 +26,7 @@ wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include/uapi/linux/
>  
>  docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
>   -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=$PWD
> +
> +docker run --cap-add=sys_admin --net=host -v /var/run/dbus:/var/run/dbus --rm=true --user="${USER}" \
> + -w "${PWD}" -v "${HOME}":"${HOME}" -t temp ./run_tests.sh
> +
> diff --git a/.org.openbmc.HostIpmi.conf.test b/.org.openbmc.HostIpmi.conf.test
> new file mode 100644
> index 0000000..196945f
> --- /dev/null
> +++ b/.org.openbmc.HostIpmi.conf.test
> @@ -0,0 +1,20 @@
> +<?xml version="1.0"?> <!--*-nxml-*-->
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
> +1.0//EN"
> +        "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
Is it just me or is this wrapped oddly?

> +
> +<!--
> +	This file is need to run openbmc bt bridge daemon.
> +	Place this file in /etc/dbus-1/system.d/
> +-->
> +
> +<busconfig>
> +
> +        <policy context="default">
> +                <allow own="org.openbmc.HostIpmi"/>
> +                <allow send_destination="org.openbmc.HostIpmi"/>
> +                <allow receive_sender="org.openbmc.HostIpmi"/>
> +        </policy>
> +
> +</busconfig>
> +

> diff --git a/bt-host.c b/bt-host.c
> new file mode 100644
> index 0000000..65bf6bb
> --- /dev/null
> +++ b/bt-host.c
> @@ -0,0 +1,235 @@
> +#define _GNU_SOURCE
> +#include <dlfcn.h>
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/types.h>          /* See NOTES */
                                   ^-- did you copy this from a manpage?
                                   I can't find a NOTES section here...
> +#include <sys/socket.h>
> +
> +#include <linux/bt-host.h>
> +
> +struct bttest_data {
> +	int status;
> +	const char msg[64];
> +};
> +
> +static int bt_host_fd;
> +static int timer_fd;
> +
> +static int stop;
> +static int sent_id = -1;
> +static int recv_id;
> +
> +/*
> + * btbridged doesn't care about the message EXCEPT the first byte must be
> + * correct.
> + * The first byte is the size not including the length byte its self.
> + * A len less than 4 will constitute an invalid message according to the BT
> + * protocol, btbridged will care.
> + */
> +static struct bttest_data data[] = {
Can this be const?

> +#define BTTEST_NUM (sizeof(data)/sizeof(struct bttest_data))
Do we have ccan here? Can we use ARRAY_SIZE?

Once again, thanks for writing tests!

Regards,
Daniel
