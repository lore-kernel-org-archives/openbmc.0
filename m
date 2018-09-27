Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="SzUgwUxF"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LKnL2Bl0zDqC3;
 Thu, 27 Sep 2018 13:20:21 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id k38-v6so1230233qtk.11;
 Wed, 26 Sep 2018 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrlAi54mr8PsQ2Ipid+ielA3XOhalMbXEd0KQiIkaa0=;
 b=SzUgwUxFaxOh/2LcNT4Egk8hEiePa3LLPGaJFmLpxtLyXPOvWironI4lNnB3C5in3h
 g2hIBwyuRMgzVqkz7FY/qGWaLV8GEen5mkv3GFQLJ1i4GIdFTygh9+t8X/A5IFSAko24
 /b5FKJS4icpoF7hb0QVPOceqX3nO7HGX7WwLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrlAi54mr8PsQ2Ipid+ielA3XOhalMbXEd0KQiIkaa0=;
 b=tbI/ZBfzKbrjCSg2is4V1LuE8R9ElkgCORqXkbzve3VjK8m0SPKIC1EDaQKsAhjpT4
 58L0j7b3AL5jYSItsySVgqReQIsyn7Sum4vf3rmFczoMFHVUi38F92C92IOioWDnO66J
 b+94kmY0oA0hnhTZVAyELYkdn0AH/TxMAf9Ha9Egvda7Kc78zkmhyGtw7utgeZVezsy2
 Bq7oQ7rt4TnR+GMst4VP7Cyg4TMsDdne+MLft6P01YbWcGCni47q1GovZ6Wf0WxDfTNe
 OEzw/bOhlEn6nZUtviLfybvbe4O3J/5UHa0DFflAiZj+Q5UPgMfgcOo3bJAkEK70ztbw
 3f0g==
X-Gm-Message-State: ABuFfoiy5uSS4ME/Z+GKs4jcJFaR3PBG87+pG3CaRu+ghQip7RiNl7DF
 ulWbaY3varx8lugp2FUv2w0CWzu71AU1LgtSyDY=
X-Google-Smtp-Source: ACcGV60a9ws2McAuc43sfe5mN8yGeK+12Y91Kglg/11rjsqP008yJm1ZAh91LXdbRy2Lt9io/niGwdj29FdE3W4J77M=
X-Received: by 2002:aed:26e7:: with SMTP id
 q94-v6mr6984173qtd.37.1538018419643; 
 Wed, 26 Sep 2018 20:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <CACPK8XcDExGvCNBcFqOOP+1zQFFs6pMao+7rsZrJFqxPgcY+1Q@mail.gmail.com>
 <F570466E-4F6C-4AE1-91E0-0B4ECC193BE0@fb.com>
 <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>
 <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
 <MWHPR15MB14861AED8F8AF652CE5E62B3B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
 <5e9c8e3f8fd54845b15cd460efe9090d@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <5e9c8e3f8fd54845b15cd460efe9090d@AUSX13MPS306.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Sep 2018 07:20:07 +0400
Message-ID: <CACPK8XfuXa19dGRqL+Ycdgh1LKmoQNuqGvtrrOgeNyvTZR01kQ@mail.gmail.com>
Subject: Re: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
To: Justin.Lee1@dell.com
Cc: Amithash Prasad <amithash@fb.com>, vijaykhemka@fb.com, 
 Sam Mendoza-Jonas <sam@mendozajonas.com>, linux-aspeed@lists.ozlabs.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, sdasari@fb.com,
 netdev@vger.kernel.org, Christian Svensson <christian@cmd.nu>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 27 Sep 2018 03:20:22 -0000

On Thu, 27 Sep 2018 at 00:39, <Justin.Lee1@dell.com> wrote:
>
> > >  As I understand Justin's version adds a generic handler, using the NCSI
> > >  Netlink interface to pass OEM commands and responses to and from
> > >  userspace, which does the actual packet handling.
> > Thanks for the direction Sam! Justin, if you don't mind, can you share the patches you have to add the support? This actually would solve a few other things we are trying to accomplish.
>
>
> Basically, I add a new flag to indicate the request is coming from the Netlink interface to allow the command handler and response handler to react.
> #define NCSI_REQ_FLAG_NETLINK_DRIVEN    2
>
> The work flow is as below.
>
> Request:
> User space application -> Netlink interface (msg) -> new Netlink handler - ncsi_send_cmd_nl() - ncsi_xmit_cmd()
>
> Response:
> Response received - ncsi_rcv_rsp() -> internal response handler - ncsi_rsp_handler_xxx() -> ncsi_send_netlink_rsp () -> Netlink interface (msg) -> user space application
> Command timeout - ncsi_request_timeout() -> ncsi_send_netlink_timeout () -> Netlink interface (msg with zero data length) -> user space application
>
> Error:
> Detected error -> ncsi_send_netlink_err () -> Netlink interface (err msg) -> user space application
>
> I will clean up some code and send out the patch.

Thanks for the overview. We look forward to your patches; please
include the same cc list as this series.

I think it makes sense to have some OEM NCSI handing purely in the
kenrel. This would allow eg. the MAC address of an interface to be
correct at boot, without requiring userspace to come up first.

I have also heard stories of temperature sensors over NCSI. Those
would make sense to be hwmon drivers, which again would mean handling
them in the kernel.

Justin, Vijay, can you please list the known NCSI OEM
commands/extensions that we plan on implementing?

Cheers,

Joel
