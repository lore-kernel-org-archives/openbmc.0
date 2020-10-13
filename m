Return-Path: <SRS0=a1Tx=DU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE59C433E7
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 02:19:30 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C34920797
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 02:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="oxI81zOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C34920797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9K4H1Ts3zDqlB
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 13:19:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=oxI81zOs; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9K2f13LMzDqh3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 13:17:57 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id m22so6256476ots.4
 for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2020 19:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wXzuIf/uOuJDpYusxvECx6JFFTmC3rPXziMamTbsAag=;
 b=oxI81zOsLtGi31YAIH+JhfJw4Ij9A5UeMfVdW47bV8+p3JgclSYudUUuVoP1BPEMeg
 R79cE8UlXrJBVR5IptKOdIdZ6b/oIx+EY2tEQCBO/3aLVfgaQgq/hNsv0UlWgr4u65Yg
 gIXHwX5ArcL602NsJpINt4IxwYOx0+x4I1Hbfvix+ICiG3WK6bKG+ByT+IsiORmKfze3
 tyGZNKqgX1RIuU4G/E/jll2BYKbivABgGvzuCZOu5Nrf6PZctXjuYxiqmgORfXiACqui
 CYlScPrQHTUkU1bLgd5rK8r4PI1fs2LK1wlOLDYWWeqLq/kx3q2385KZYZl7V4cs0/5J
 BtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wXzuIf/uOuJDpYusxvECx6JFFTmC3rPXziMamTbsAag=;
 b=T8ZQhV2S2AFt6F1k7eomUXckvAtXZXT6cNF+SBx6OmoEIRuST+fFZZI/yF9mztLZ8h
 hQLawQWhseSfYgJwGd3yHTzZNSHoge+fQzJVmQJWnnSQPhiRWPdeENeiXPDqzHObf5/g
 +MTtWFFUtZlJLChnRMkBwg+DK9qHU4SCvRHN7ElVa8Brw8gxKYBVZL1+x4SLtFd7IiWm
 bGCYbN1n7+gPpSZMszl4fgt4zluhi/FDl09zHFaIIfZl45BPOJt4RPvEWjBFpRNUAYj/
 o5SfhVKYo6NusLh3wCeArKLVjTtm2cQ8hPyDiIrWcARkX6+w/De+Sa5ZusVgQ5i7lXri
 2xTQ==
X-Gm-Message-State: AOAM533cA7I+mI2Z7LsGx/eDkMni+UHm/FQjhGxVmSIhzJa5Ofhn+XNs
 eUt0+vNqU2TeZIXhfYGOr1TSM5+WvVRao6NmYEID3A==
X-Google-Smtp-Source: ABdhPJxGi2+h7FZFZgnTniNdBiMtlG/02ZZ1xqr0zM/k4LvAWncIqBy4jEeW3tG7d43XGc4aVLG7ZH+uW/FoJmHpKUo=
X-Received: by 2002:a05:6830:1bce:: with SMTP id
 v14mr18103477ota.361.1602555474328; 
 Mon, 12 Oct 2020 19:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 13 Oct 2020 10:17:43 +0800
Message-ID: <CAGm54UFuP60G6-2BYerdK_+ssuWh0BYUBVdBCSaBHrHbHD0MFQ@mail.gmail.com>
Subject: Re: How to list all sensors through redfish?
To: "Li, Yong B" <yong.b.li@intel.com>, Ed Tanous <ed@tanous.net>
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
 "feistjj@gmail.com" <feistjj@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Sat, Oct 10, 2020 at 9:06 PM Li, Yong B <yong.b.li@intel.com> wrote:
>
> Hi All,
>
>
>
> Based on the current bmcweb implementation:
>
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hp=
p#L61
>
>
>
> The below URL only list these power/current/utilization sensors:
>
> redfish/v1/Chassis/$chassis/Sensors
>
>
>
> Just want to know why not list all running sensors? Is it required by red=
fish spec?
>
>
>
> Is there any way to  list all sensors through redfish interface? Like the=
 =E2=80=9Cipmitool sensor list=E2=80=9D command?
>

I just saw some discussion in the IRC by GunnarM quoted as:

> /sensors is sensors that aren't in Power/Thermal https://redfishforum.com=
/thread/190/sensorcollection-contain-all-sensors-chassis
> For 2020.4 this changes, all sensors will be under /sensors with only a l=
ink to the Power/Thermal/Fan/Powersupply schemas

But from the Redfish spec it does not say /sensors should exclude the
ones in Power/Thermal, instead /sensors is "the link to the collection
of sensors located in the equipment and sub-components".
So I am expecting that it should contain all the sensors in the system.
In OpenBMC, this could be done by returning all the objects that
implement the xyz.openbmc_project.Sensor.Value interface.

@Ed Tanous @GunnarM Could you kindly provide some comments?

Thanks!

--=20
BRs,
Lei YU
