Return-Path: <SRS0=c7Hd=LP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D60C48BC2
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 10:30:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547B561040
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 10:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547B561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7m5P3srMz308F
	for <openbmc@archiver.kernel.org>; Mon, 21 Jun 2021 20:30:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Hg+kAnMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2a;
 helo=mail-vs1-xe2a.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hg+kAnMu; dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7m4s4tvgz2yYV
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 20:30:20 +1000 (AEST)
Received: by mail-vs1-xe2a.google.com with SMTP id v12so368021vsg.10
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qsjeLkPbrpKOhBzWGz9UmbOpkACf8WChv6WOAPdkMkc=;
 b=Hg+kAnMu3QnxV4UmVyfYOZgIFl/QL2d+Iycqlf7J9ymuboieEoK848f18PyOit7tSt
 XdscR0kz76w9xZjCSIpegczQ7d/e1ZWGELGcCL2UDGS1IxF8BA+jnHEi36AF+3/tPf4n
 ioqUPmnrU79mhuHjvOUbciWjL1aagql+OTu8FzOJsLiWaLie28N5gvL2fzfiY7U3oHwJ
 LSL53IUJ+EtytLQKPrSWKGTNclk+C6XngIf0g7eYLbtNlGlsB4P21fVC7IcTYTBQmBDX
 sgU9FW0F7KkV6Brm9jFRb/OYOyz8mPvC9WDKBBIZwHJRimMZV++LDBy+0LlX9Dq+Tuag
 g9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qsjeLkPbrpKOhBzWGz9UmbOpkACf8WChv6WOAPdkMkc=;
 b=g5yy/MwCWLtvc7Qk2uPVraL1QzWh4I9eMNGq5aE2LwlrQ3t1qbnvlh7KCDXXsPDc7N
 FhvRRYaa5EhFtbbIvRmvYQw6UZF7Q4C29nx4Hw8WVHmiO5C34pds9Zz2BNIA0mKZikzQ
 zdUiBKUyRPDn4yjjoFTXmJYD/ZoAVIOXUPttJYIHymo3LtLmvnNo2/kVwSaNyCNe4bko
 y6nwqMYIUUwPORqPR1wT9SGDevQpTwHQmWNhnYXjsKBeXeIRFCvIQHucrQwIV7GYs6O6
 ME8U86hv29VjwD/yz+UADcRAYYYnP9tZOScqrW3bv04ClPBrFD4/FCmi4/CjMa27I5fP
 VjnQ==
X-Gm-Message-State: AOAM530mZu0Aura1p4P+XjFJb48zDaAX+XjM/MlEgcsvcoCRaIFxIOtn
 fnAYTdHi3xeixAdzEUQxlhlJQyvlVZyX7gMqs4w=
X-Google-Smtp-Source: ABdhPJy4Je0Tc+KG/aNHdpIG7xvnTJjRraUeWhLgj0/o8cKNSWaZBUnTN1fUhd2OBAXB1fVXwgHVfNoHc0w9MFKUqUw=
X-Received: by 2002:a67:f3c1:: with SMTP id j1mr3272422vsn.43.1624271416265;
 Mon, 21 Jun 2021 03:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <HK0PR04MB2964EBAACD7025A165BB68C1FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2964EBAACD7025A165BB68C1FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Mon, 21 Jun 2021 16:00:05 +0530
Message-ID: <CAM=TmwXsDhDFTCaHCwyAjnAJSggWjWLgeaCz9qN0BCwsDKRfWQ@mail.gmail.com>
Subject: Re: Adding dependent service as Entity-manager to Ipmb-fru-service
To: Kumar Thangavel <thangavel.k@hcl.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Kumar,

On Mon, Jun 21, 2021 at 3:02 PM Kumar Thangavel <thangavel.k@hcl.com> wrote=
:
>
> Classification: Public
>
> Changing classification as Public.
>
>
>
> From: Kumar Thangavel
> Sent: Monday, June 21, 2021 2:58 PM
> To: openbmc@lists.ozlabs.org
> Cc: Ed Tanous <ed@tanous.net>; Patrick Williams <patrick@stwcx.xyz>; Velu=
mani T-ERS,HCLTech <velumanit@hcl.com>
> Subject: Adding dependent service as Entity-manager to Ipmb-fru-service
>
>
>
> Classification: Confidential
>
> Hi All,
>
>
>
>            Ipmb-fru-device deamon trying to read some dbus objects from e=
ntity-manager to get the ipmb bus details. Entity-manager daemon initially =
taking some time to load all the dbus objects. But Ipmb-fru-device deamon s=
tarts at system startup.
>
>
>
>            Since, Entity-manager deamon initially taking some time to loa=
d all the dbus objects, ipmb-fru-device getting the below error.
>
>
>
>           Error :
>
>           =E2=80=9Cipmb-fru-device[345]:   what():  sd_bus_call: org.free=
desktop.DBus.Error.UnknownObject: Unknown object '/xyz/openbmc_project/inve=
ntory/system/board/Yosemite_V2_Baseboard/IpmbBus1'.=E2=80=9D
>
>
>
>          When we restart EM deamon once, this error got resolved.
>
>
>
>          I tried to add EM service as dependent service to Ipmb-fru-devic=
e service. Added EM service in =E2=80=9CWants=E2=80=9D, =E2=80=9CAfter=E2=
=80=9D fields in Ipmb-fru-service service.
>
>
>
>          But, still EM deamon taking some time load all the dbus objects.
>
>
>
>          So, Could you please let us know to how to add the EM as depende=
nt service. Or Please let us know if any other approach.

Isn't this supposed to be the other way around? A FRU daemon reads
EEPROMs (or other means) and hosts raw FRU information on D-Bus, and
then EM can add known D-Bus interfaces based on that. Either way, you
may not need a dependency if you go by standard D-Bus signals
(InterfacesAdded/PropertiesChanged).

Regards,
Deepak
