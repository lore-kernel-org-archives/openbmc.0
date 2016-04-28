Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwSvB0XvRzDqCK
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Gfz0EbYi; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fJr9Cdee; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id b10so11755552oig.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cE5Y4+dbn51RQ/tTVb3r/5NSz2+TGnaCXo1Mxf/UKls=;
 b=Gfz0EbYiuFPAEQqCbPTCUNEFDpjCcbTX3rzJzxaaTgzwZQYJzQ3p4mJ1Pbxpb1EdeO
 0Xzihnir7+JNUOge/t6rkJhpwbqOxBrb3Wnlb/DlQYe6AZBOmxEkK65yMprOXimbvO42
 zMVNAybTpENvSq1wFJ12DS/vzFXFSGs4UxTDgJi9xCAzpkBeHK4R1t9OpzLzpJwfc0Iz
 EqalbHsy/oH6Srj/6rAUF6rNPPTGXL6o3A63ozfqHC3hWIFbWx2wTaP3FHHnTevM70S0
 AkC+t3snFPjsC1ETAnN/34WjPQ2d9YhyQFqF66vStQgmOZj4t5ph8f/fLaqPcm9bvLwG
 QLLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cE5Y4+dbn51RQ/tTVb3r/5NSz2+TGnaCXo1Mxf/UKls=;
 b=fJr9Cdeeq6KLA/8uUo7C61EDSGa56YjXgyj7kybvQ3VH1qn+BZ2FOhqmVDimkJGftf
 B3rKLaJ0pJ9AcC6YrdRdqw1qodTPdAXdKNLfP++XOvxPU1XbId08So+UkYGSCU/ZifBm
 DGFwZVjqT9+kw/QJXsx7FZ6rX7GwKKnMerBek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cE5Y4+dbn51RQ/tTVb3r/5NSz2+TGnaCXo1Mxf/UKls=;
 b=eBnkUq0aohD8MHAyALMoInq9b7kZ+A2sVNtc+ZFe8VrBZOywH/e3tBo9uK8Ci9+JZN
 vQHj257SNY53/3QSYFIBJ2dNGXqWqUgZUjiit0y5e7rPoemxZz4MepHcsVKHJzulJC/U
 bHMYhnOQIfIfiQBSekxLUpJhlBCCHmtZgxKMe5GcsEvzCQXuUAT7CvfT62FjhMhKmT1S
 QXFhUqDTYSCLJk1zNS2QY7GZLlGAc+a0Isa9JGobqs0+H+2peTpoc6LsJuujg6DRmZCI
 p3+RW0Eqm0sippSAQhcc8m/EJzqKDX6KNJb+p22DLba2AvwgUUXL+hl6sGEVSzMeKGBp
 gOQQ==
X-Gm-Message-State: AOPr4FWDCYWbenfmJYk35UK02m7mFeA4E6ChrzRbVPtwQ1WHDmMR1P/1GCshFrP7kEQYLT7S/yo984RAmkhiSA==
X-Received: by 10.202.199.71 with SMTP id x68mr5047675oif.150.1461828116166;
 Thu, 28 Apr 2016 00:21:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 28 Apr 2016 00:21:36 -0700 (PDT)
In-Reply-To: <1461820769-10414-2-git-send-email-jk@ozlabs.org>
References: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
 <1461820769-10414-2-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Apr 2016 16:51:36 +0930
X-Google-Sender-Auth: Vpr48MFbYPb-TIZ-P7DuvB20FTA
Message-ID: <CACPK8XddbiUueO1AbtvRb-0kqEtkoczMPfnWcYEhgwGXizEV2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] tty: Add handler for local tty mirroring
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 28 Apr 2016 07:21:58 -0000

On Thu, Apr 28, 2016 at 2:49 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> This change adds a simple handler for mirroring data to local tty
> device, like a hardware UART.
>
> This is specified through a new config parameter 'local-tty'.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Makefile.am              |   1 +
>  obmc-console.conf.sample |   3 ++
>  tty-handler.c            | 123 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 tty-handler.c
>
> diff --git a/Makefile.am b/Makefile.am
> index 5f0a1bb..2df24d8 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -34,6 +34,7 @@ obmc_console_server_SOURCES =3D \
>          config.c \
>          log-handler.c \
>          socket-handler.c \
> +        tty-handler.c \
>          console-socket.c
>
>  obmc_console_client_SOURCES =3D \
> diff --git a/obmc-console.conf.sample b/obmc-console.conf.sample
> index a5b8808..d473af2 100644
> --- a/obmc-console.conf.sample
> +++ b/obmc-console.conf.sample
> @@ -4,3 +4,6 @@ device =3D ttyUSB0
>  # For VUART devices, we can specify the LPC address and SIRQ parameters
>  lpc-address =3D 0x3f8
>  sirq =3D 4
> +
> +# To mirror to a local tty device (typically a hardware UART), set local=
-tty
> +# local-tty =3D ttyS0
> diff --git a/tty-handler.c b/tty-handler.c
> new file mode 100644
> index 0000000..00ada7a
> --- /dev/null
> +++ b/tty-handler.c
> @@ -0,0 +1,123 @@
> +/**
> + * Copyright =C2=A9 2016 IBM Corporation
> + *
> + * Licensed under the Apache License, Version 2.0 (the "License");
> + * you may not use this file except in compliance with the License.
> + * You may obtain a copy of the License at
> + *
> + *     http://www.apache.org/licenses/LICENSE-2.0
> + *
> + * Unless required by applicable law or agreed to in writing, software
> + * distributed under the License is distributed on an "AS IS" BASIS,
> + * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impli=
ed.
> + * See the License for the specific language governing permissions and
> + * limitations under the License.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <assert.h>
> +#include <err.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "console-server.h"
> +
> +struct tty_handler {
> +       struct handler  handler;
> +       struct console  *console;
> +       struct poller   *poller;
> +       int             fd;
> +};
> +
> +static struct tty_handler *to_tty_handler(struct handler *handler)
> +{
> +       return container_of(handler, struct tty_handler, handler);
> +}
> +
> +static enum poller_ret tty_poll(struct handler *handler,
> +               int events, void __attribute__((unused)) *data)
> +{
> +       struct tty_handler *th =3D to_tty_handler(handler);
> +       uint8_t buf[4096];
> +       ssize_t len;
> +
> +       if (!(events & POLLIN))
> +               return POLLER_OK;
> +
> +       len =3D read(th->fd, buf, sizeof(buf));
> +       if (len <=3D 0) {
> +               th->poller =3D NULL;
> +               close(th->fd);
> +               return POLLER_REMOVE;
> +       }
> +
> +       console_data_out(th->console, buf, len);
> +
> +       return POLLER_OK;
> +}
> +
> +static int tty_init(struct handler *handler, struct console *console,
> +               struct config *config __attribute__((unused)))
> +{
> +       struct tty_handler *th =3D to_tty_handler(handler);
> +       const char *tty_name;
> +       char *tty_path;
> +       int rc, flags;
> +
> +       tty_name =3D config_get_value(config, "local-tty");
> +       if (!tty_name)
> +               return -1;
> +
> +       rc =3D asprintf(&tty_path, "/dev/%s", tty_name);
> +       if (!rc)
> +               return -1;
> +
> +       th->fd =3D open(tty_path, O_RDWR);
> +       if (th->fd < 0) {
> +               warn("Can't open %s; disabling local tty", tty_name);
> +               free(tty_path);
> +               return -1;
> +       }
> +
> +       free(tty_path);
> +
> +       /* initial tty setup */
> +       flags =3D fcntl(th->fd, F_GETFL, 0);
> +       flags |=3D FNDELAY;
> +       fcntl(th->fd, F_SETFL, flags);
> +
> +       th->poller =3D console_register_poller(console, handler, tty_poll=
,
> +                       th->fd, POLLIN, NULL);
> +       th->console =3D console;
> +
> +       return 0;
> +}
> +
> +static int tty_data(struct handler *handler, uint8_t *buf, size_t len)
> +{
> +       struct tty_handler *th =3D to_tty_handler(handler);
> +       return write_buf_to_fd(th->fd, buf, len);
> +}
> +
> +static void tty_fini(struct handler *handler)
> +{
> +       struct tty_handler *th =3D to_tty_handler(handler);
> +       if (th->poller)
> +               console_unregister_poller(th->console, th->poller);
> +       close(th->fd);
> +}
> +
> +static struct tty_handler tty_handler =3D {
> +       .handler =3D {
> +               .name           =3D "tty",
> +               .init           =3D tty_init,
> +               .data_in        =3D tty_data,
> +               .fini           =3D tty_fini,
> +       },
> +};
> +
> +console_register_handler(&tty_handler.handler);
> +
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
