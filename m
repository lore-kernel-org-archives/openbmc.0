Return-Path: <blue@cmd.nu>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cmd.nu
 (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=blue@cmd.nu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=cmd.nu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cmd.nu header.i=@cmd.nu header.b="B4i2xnKh"; 
 dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PTlD6vS7zF3Jp
 for <openbmc@lists.ozlabs.org>; Tue,  2 Oct 2018 16:29:23 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id y19-v6so1033526edd.2
 for <openbmc@lists.ozlabs.org>; Mon, 01 Oct 2018 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmd.nu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PI2E6I8yDcFbg15rdjfcRBECLiduq/azq/4zWoPTBMo=;
 b=B4i2xnKhinRobv1Cxry2KiQSnwsF6n+hsY0nBGx0ujWrIYbpFnrxFU+R0EXJ7cr/er
 hG1/KDmcHoVU8fL84WVcwvbczVpKjZWTmoc1Hi8Q+fwWFWgHQ6zMV+C+JIpQNub8TGTF
 BaolP5assVIsOlVcZVaoFjkanEHfW9KHdLxns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PI2E6I8yDcFbg15rdjfcRBECLiduq/azq/4zWoPTBMo=;
 b=dLIv5BtTw+qnfVpUCQpYG/V6wFRoVHVEBWkEB/GvEv4qLuqU0O0+LIhOTZR2zjBHYO
 YEA9wyLel6b69fHmP4Xt4IgXwZWbBx3S1XW1QsV4Tow9NKTNlXR6IecKqSs+qQ/l/4IQ
 LtZ9rSdWGAbrTovg2KLWa36OoLpYxCDWybx0IAPWay0IcJPTaPq9yBPe19azoyKa0q+I
 XQn6vRDr7mC947H0yySrFuj9BpTr5lxYGbUjnC7DrPOtP+J3dOGHM59OoyNCEkEdmyLV
 0rgbAAXVrCSQpDxWlI+bFbOqEWRG6SOZXrOFJkTRjewDD90JO1K6aZivbYoeujSmsjc/
 GTxA==
X-Gm-Message-State: ABuFfojzE5tg8FBXgSW7V4T8HR/h9u6zh5HK0CXNY2XoUNR1qtWV3Kml
 Th7RUXblcawLhJaAKWK+b6vXz+cGcg6L3UgaOGkhrQ==
X-Google-Smtp-Source: ACcGV616foqDICSWZucetTkp0XutQ4A3MlLmaHa0pRnMDHt9Tr4Mk4C1yfhlRX+j6NYx1KKfpUjirNkCDVoh5Cbpi8g=
X-Received: by 2002:a50:b7b7:: with SMTP id
 h52-v6mr22447392ede.17.1538461760469; 
 Mon, 01 Oct 2018 23:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180929010602.1025909-1-vijaykhemka@fb.com>
 <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
In-Reply-To: <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
From: Christian Svensson <christian@cmd.nu>
Date: Tue, 2 Oct 2018 08:29:08 +0200
Message-ID: <CADiuDAR4PovUC9CxF=MAiCnwJ9=MmLO_HcThEMhzAZribhsRDw@mail.gmail.com>
Subject: Re: [PATCH v2] net/ncsi: Add NCSI OEM command support
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>,
 "Justin . Lee1 @ Dell . com" <Justin.Lee1@dell.com>, 
 "joel @ jms . id . au" <joel@jms.id.au>, 
 "linux-aspeed @ lists . ozlabs . org" <linux-aspeed@lists.ozlabs.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Sai Dasari <sdasari@fb.com>, 
 "netdev @ vger . kernel . org" <netdev@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000bbcf340577390a93"
X-Mailman-Approved-At: Tue, 09 Oct 2018 09:45:20 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2018 06:29:31 -0000

--000000000000bbcf340577390a93
Content-Type: text/plain; charset="UTF-8"

I'm just going to say that I'm very excited about these patches. Just what
I needed, thanks for contributing them :-).

On Tue, Oct 2, 2018, 03:20 Samuel Mendoza-Jonas <sam@mendozajonas.com>
wrote:

> On Fri, 2018-09-28 at 18:06 -0700, Vijay Khemka wrote:
> > This patch adds OEM commands and response handling. It also defines OEM
> > command and response structure as per NCSI specification along with its
> > handlers.
> >
> > ncsi_cmd_handler_oem: This is a generic command request handler for OEM
> > commands
> > ncsi_rsp_handler_oem: This is a generic response handler for OEM commands
> >
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>
> Hi Vijay - looks good to me, and should be a good common base for your
> and Justin's changes.
>
> Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
>
> > ---
> >  net/ncsi/internal.h |  4 ++++
> >  net/ncsi/ncsi-cmd.c | 31 ++++++++++++++++++++++++++++---
> >  net/ncsi/ncsi-pkt.h | 16 ++++++++++++++++
> >  net/ncsi/ncsi-rsp.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
> >  4 files changed, 91 insertions(+), 4 deletions(-)
> >
> > diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> > index 8055e3965cef..c16cb7223064 100644
> > --- a/net/ncsi/internal.h
> > +++ b/net/ncsi/internal.h
> > @@ -68,6 +68,10 @@ enum {
> >       NCSI_MODE_MAX
> >  };
> >
> > +/* OEM Vendor Manufacture ID */
> > +#define NCSI_OEM_MFR_MLX_ID             0x8119
> > +#define NCSI_OEM_MFR_BCM_ID             0x113d
> > +
> >  struct ncsi_channel_version {
> >       u32 version;            /* Supported BCD encoded NCSI version */
> >       u32 alpha2;             /* Supported BCD encoded NCSI version */
> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > index 7567ca63aae2..2f98533eba46 100644
> > --- a/net/ncsi/ncsi-cmd.c
> > +++ b/net/ncsi/ncsi-cmd.c
> > @@ -211,6 +211,26 @@ static int ncsi_cmd_handler_snfc(struct sk_buff
> *skb,
> >       return 0;
> >  }
> >
> > +static int ncsi_cmd_handler_oem(struct sk_buff *skb,
> > +                             struct ncsi_cmd_arg *nca)
> > +{
> > +     struct ncsi_cmd_oem_pkt *cmd;
> > +     unsigned int len;
> > +
> > +     len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > +     if (nca->payload < 26)
> > +             len += 26;
> > +     else
> > +             len += nca->payload;
> > +
> > +     cmd = skb_put_zero(skb, len);
> > +     cmd->mfr_id = nca->dwords[0];
> > +     memcpy(cmd->data, &nca->dwords[1], nca->payload - 4);
> > +     ncsi_cmd_build_header(&cmd->cmd.common, nca);
> > +
> > +     return 0;
> > +}
> > +
> >  static struct ncsi_cmd_handler {
> >       unsigned char type;
> >       int           payload;
> > @@ -244,7 +264,7 @@ static struct ncsi_cmd_handler {
> >       { NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
> >       { NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
> >       { NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
> > -     { NCSI_PKT_CMD_OEM,    0, NULL                     },
> > +     { NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
> >       { NCSI_PKT_CMD_PLDM,   0, NULL                     },
> >       { NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
> >  };
> > @@ -316,8 +336,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
> >               return -ENOENT;
> >       }
> >
> > -     /* Get packet payload length and allocate the request */
> > -     nca->payload = nch->payload;
> > +     /* Get packet payload length and allocate the request
> > +      * It is expected that if length set as negative in
> > +      * handler structure means caller is initializing it
> > +      * and setting length in nca before calling xmit function
> > +      */
> > +     if (nch->payload >= 0)
> > +             nca->payload = nch->payload;
> >       nr = ncsi_alloc_command(nca);
> >       if (!nr)
> >               return -ENOMEM;
> > diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> > index 91b4b66438df..1f338386810d 100644
> > --- a/net/ncsi/ncsi-pkt.h
> > +++ b/net/ncsi/ncsi-pkt.h
> > @@ -151,6 +151,22 @@ struct ncsi_cmd_snfc_pkt {
> >       unsigned char           pad[22];
> >  };
> >
> > +/* OEM Request Command as per NCSI Specification */
> > +struct ncsi_cmd_oem_pkt {
> > +     struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
> > +     __be32                  mfr_id;      /* Manufacture ID    */
> > +     unsigned char           data[64];    /* OEM Payload Data  */
> > +     __be32                  checksum;    /* Checksum          */
> > +};
> > +
> > +/* OEM Response Packet as per NCSI Specification */
> > +struct ncsi_rsp_oem_pkt {
> > +     struct ncsi_rsp_pkt_hdr rsp;         /* Command header    */
> > +     __be32                  mfr_id;      /* Manufacture ID    */
> > +     unsigned char           data[64];    /* Payload data      */
> > +     __be32                  checksum;    /* Checksum          */
> > +};
> > +
> >  /* Get Link Status */
> >  struct ncsi_rsp_gls_pkt {
> >       struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
> > diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> > index 930c1d3796f0..22664ebdc93a 100644
> > --- a/net/ncsi/ncsi-rsp.c
> > +++ b/net/ncsi/ncsi-rsp.c
> > @@ -596,6 +596,48 @@ static int ncsi_rsp_handler_snfc(struct
> ncsi_request *nr)
> >       return 0;
> >  }
> >
> > +static struct ncsi_rsp_oem_handler {
> > +     unsigned int    mfr_id;
> > +     int             (*handler)(struct ncsi_request *nr);
> > +} ncsi_rsp_oem_handlers[] = {
> > +     { NCSI_OEM_MFR_MLX_ID, NULL },
> > +     { NCSI_OEM_MFR_BCM_ID, NULL }
> > +};
> > +
> > +
> > +/* Response handler for OEM command */
> > +static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
> > +{
> > +     struct ncsi_rsp_oem_pkt *rsp;
> > +     struct ncsi_rsp_oem_handler *nrh = NULL;
> > +     unsigned int mfr_id, i;
> > +
> > +     /* Get the response header */
> > +     rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> > +     mfr_id = ntohl(rsp->mfr_id);
> > +
> > +     /* Check for manufacturer id and Find the handler */
> > +     for (i = 0; i < ARRAY_SIZE(ncsi_rsp_oem_handlers); i++) {
> > +             if (ncsi_rsp_oem_handlers[i].mfr_id == mfr_id) {
> > +                     if (ncsi_rsp_oem_handlers[i].handler)
> > +                             nrh = &ncsi_rsp_oem_handlers[i];
> > +                     else
> > +                             nrh = NULL;
> > +
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!nrh) {
> > +             netdev_err(nr->ndp->ndev.dev, "Received unrecognized OEM
> packet with MFR-ID (0x%x)\n",
> > +                        mfr_id);
> > +             return -ENOENT;
> > +     }
> > +
> > +     /* Process the packet */
> > +     return nrh->handler(nr);
> > +}
> > +
> >  static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)
> >  {
> >       struct ncsi_rsp_gvi_pkt *rsp;
> > @@ -932,7 +974,7 @@ static struct ncsi_rsp_handler {
> >       { NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
> >       { NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
> >       { NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
> > -     { NCSI_PKT_RSP_OEM,     0, NULL                     },
> > +     { NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
> >       { NCSI_PKT_RSP_PLDM,    0, NULL                     },
> >       { NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
> >  };
>
>
>

--000000000000bbcf340577390a93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;m just going to say that I&#39;m very excited about=
 these patches. Just what I needed, thanks for contributing them :-).</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 2, 2018, 03:20 =
Samuel Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.com">sam@mendoz=
ajonas.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, =
2018-09-28 at 18:06 -0700, Vijay Khemka wrote:<br>
&gt; This patch adds OEM commands and response handling. It also defines OE=
M<br>
&gt; command and response structure as per NCSI specification along with it=
s<br>
&gt; handlers.<br>
&gt; <br>
&gt; ncsi_cmd_handler_oem: This is a generic command request handler for OE=
M<br>
&gt; commands<br>
&gt; ncsi_rsp_handler_oem: This is a generic response handler for OEM comma=
nds<br>
&gt; <br>
&gt; Signed-off-by: Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" =
target=3D"_blank" rel=3D"noreferrer">vijaykhemka@fb.com</a>&gt;<br>
<br>
Hi Vijay - looks good to me, and should be a good common base for your<br>
and Justin&#39;s changes.<br>
<br>
Reviewed-by: Samuel Mendoza-Jonas &lt;<a href=3D"mailto:sam@mendozajonas.co=
m" target=3D"_blank" rel=3D"noreferrer">sam@mendozajonas.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 net/ncsi/internal.h |=C2=A0 4 ++++<br>
&gt;=C2=A0 net/ncsi/ncsi-cmd.c | 31 ++++++++++++++++++++++++++++---<br>
&gt;=C2=A0 net/ncsi/ncsi-pkt.h | 16 ++++++++++++++++<br>
&gt;=C2=A0 net/ncsi/ncsi-rsp.c | 44 +++++++++++++++++++++++++++++++++++++++=
++++-<br>
&gt;=C2=A0 4 files changed, 91 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h<br>
&gt; index 8055e3965cef..c16cb7223064 100644<br>
&gt; --- a/net/ncsi/internal.h<br>
&gt; +++ b/net/ncsi/internal.h<br>
&gt; @@ -68,6 +68,10 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NCSI_MODE_MAX<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/* OEM Vendor Manufacture ID */<br>
&gt; +#define NCSI_OEM_MFR_MLX_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x8119<br>
&gt; +#define NCSI_OEM_MFR_BCM_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x113d<br>
&gt; +<br>
&gt;=C2=A0 struct ncsi_channel_version {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 version;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Supported BCD encoded NCSI version */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 alpha2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Supported BCD encoded NCSI version */<br>
&gt; diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c<br>
&gt; index 7567ca63aae2..2f98533eba46 100644<br>
&gt; --- a/net/ncsi/ncsi-cmd.c<br>
&gt; +++ b/net/ncsi/ncsi-cmd.c<br>
&gt; @@ -211,6 +211,26 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *=
skb,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static int ncsi_cmd_handler_oem(struct sk_buff *skb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ncsi_cmd_arg *nca)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ncsi_cmd_oem_pkt *cmd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int len;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0len =3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (nca-&gt;payload &lt; 26)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D 26;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len +=3D nca-&gt;payl=
oad;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd =3D skb_put_zero(skb, len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd-&gt;mfr_id =3D nca-&gt;dwords[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memcpy(cmd-&gt;data, &amp;nca-&gt;dwords[1], nca-=
&gt;payload - 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ncsi_cmd_build_header(&amp;cmd-&gt;cmd.common, nc=
a);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static struct ncsi_cmd_handler {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
payload;<br>
&gt; @@ -244,7 +264,7 @@ static struct ncsi_cmd_handler {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_GNS,=C2=A0 =C2=A0 0, ncsi_cmd=
_handler_default },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_GNPTS,=C2=A0 0, ncsi_cmd_hand=
ler_default },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_GPS,=C2=A0 =C2=A0 0, ncsi_cmd=
_handler_default },<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_OEM,=C2=A0 =C2=A0 0, NULL=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_OEM,=C2=A0 =C2=A0-1, ncsi_cmd_hand=
ler_oem=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_PLDM,=C2=A0 =C2=A00, NULL=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_d=
efault }<br>
&gt;=C2=A0 };<br>
&gt; @@ -316,8 +336,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Get packet payload length and allocate the req=
uest */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0nca-&gt;payload =3D nch-&gt;payload;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Get packet payload length and allocate the req=
uest<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * It is expected that if length set as negative =
in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * handler structure means caller is initializing=
 it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * and setting length in nca before calling xmit =
function<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (nch-&gt;payload &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nca-&gt;payload =3D n=
ch-&gt;payload;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nr =3D ncsi_alloc_command(nca);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h<br>
&gt; index 91b4b66438df..1f338386810d 100644<br>
&gt; --- a/net/ncsi/ncsi-pkt.h<br>
&gt; +++ b/net/ncsi/ncsi-pkt.h<br>
&gt; @@ -151,6 +151,22 @@ struct ncsi_cmd_snfc_pkt {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pad[22];<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/* OEM Request Command as per NCSI Specification */<br>
&gt; +struct ncsi_cmd_oem_pkt {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ncsi_cmd_pkt_hdr cmd;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Command header=C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__be32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mfr_id;=C2=A0 =C2=A0 =C2=A0 /* Manufacture ID=C2=A0 =
=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0data[64];=C2=A0 =C2=A0 /* OEM Payload Data=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__be32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 checksum;=C2=A0 =C2=A0 /* Checksum=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 */<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* OEM Response Packet as per NCSI Specification */<br>
&gt; +struct ncsi_rsp_oem_pkt {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ncsi_rsp_pkt_hdr rsp;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Command header=C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__be32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 mfr_id;=C2=A0 =C2=A0 =C2=A0 /* Manufacture ID=C2=A0 =
=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0data[64];=C2=A0 =C2=A0 /* Payload data=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__be32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 checksum;=C2=A0 =C2=A0 /* Checksum=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 */<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 /* Get Link Status */<br>
&gt;=C2=A0 struct ncsi_rsp_gls_pkt {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ncsi_rsp_pkt_hdr rsp;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Response header=C2=A0 =C2=A0*/<br>
&gt; diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c<br>
&gt; index 930c1d3796f0..22664ebdc93a 100644<br>
&gt; --- a/net/ncsi/ncsi-rsp.c<br>
&gt; +++ b/net/ncsi/ncsi-rsp.c<br>
&gt; @@ -596,6 +596,48 @@ static int ncsi_rsp_handler_snfc(struct ncsi_requ=
est *nr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static struct ncsi_rsp_oem_handler {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 mfr_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(*handler)(struct ncsi_request *nr);<br>
&gt; +} ncsi_rsp_oem_handlers[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ NCSI_OEM_MFR_MLX_ID, NULL },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ NCSI_OEM_MFR_BCM_ID, NULL }<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +/* Response handler for OEM command */<br>
&gt; +static int ncsi_rsp_handler_oem(struct ncsi_request *nr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ncsi_rsp_oem_pkt *rsp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ncsi_rsp_oem_handler *nrh =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int mfr_id, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Get the response header */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rsp =3D (struct ncsi_rsp_oem_pkt *)skb_network_he=
ader(nr-&gt;rsp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mfr_id =3D ntohl(rsp-&gt;mfr_id);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Check for manufacturer id and Find the handler=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(ncsi_rsp_oem_hand=
lers); i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ncsi_rsp_oem_hand=
lers[i].mfr_id =3D=3D mfr_id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ncsi_rsp_oem_handlers[i].handler)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nrh =3D &amp;ncsi_rsp_oem_handlers[i];<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nrh =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!nrh) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netdev_err(nr-&gt;ndp=
-&gt;ndev.dev, &quot;Received unrecognized OEM packet with MFR-ID (0x%x)\n&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mfr_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Process the packet */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return nrh-&gt;handler(nr);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ncsi_rsp_gvi_pkt *rsp;<br>
&gt; @@ -932,7 +974,7 @@ static struct ncsi_rsp_handler {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_GNS,=C2=A0 =C2=A0172, ncsi_rs=
p_handler_gns=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_=
gnpts=C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_GPS,=C2=A0 =C2=A0 =C2=A08, nc=
si_rsp_handler_gps=C2=A0 =C2=A0 =C2=A0},<br>
&gt; -=C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_OEM,=C2=A0 =C2=A0 =C2=A00, NULL=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_OEM,=C2=A0 =C2=A0 -1, ncsi_rsp_han=
dler_oem=C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_PLDM,=C2=A0 =C2=A0 0, NULL=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_=
gpuuid=C2=A0 }<br>
&gt;=C2=A0 };<br>
<br>
<br>
</blockquote></div>

--000000000000bbcf340577390a93--
