Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEgdI3y9"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41T7yd6hWVzF35t
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 00:21:45 +1000 (AEST)
Received: by mail-io0-x244.google.com with SMTP id l7-v6so35395090ioj.1
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jul 2018 07:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwrHmSwaKFEj7UAzOiGtg/R2tT5uN81aJzsvscf64Zw=;
 b=mEgdI3y97Fu6e4ldcWAOAEbzsC8aAFR5fxceJ4JESjNiAdhvl+UZ1pl5U+hxUNFtrk
 ANn4TbnKHFPa2Hl08mCg/Uw5Aa10RVFt5jPiNIbqEMpn4ZclLGf0KNXSE3cisTQFRJNd
 Vi93OwuhokafpGufptDxTuPiMhXRTv5H2US8Ja/EqD8A2JKCfX0jHU+cDrkO51qx2DGD
 qvp882W/jJg00L5RloWtIvO5sOW8DACrB7rWbJ0LsmMpJeagrX0eJS7pMqpJP+8CsGU5
 OvVrIqa62bza1VwhNJ2tBCipgdCgK2bfelOs0vUCp4oDmAmIdymMuc4cuKOMj3Q7Dci2
 7r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwrHmSwaKFEj7UAzOiGtg/R2tT5uN81aJzsvscf64Zw=;
 b=TdKLMw5G0cnmMhDOYgEJA1zKxd2kF1Awe1Y1Cmnuvz+sENjQu+mD5IgLQZ5Qvq+A7j
 RFlX0OihRQnzlgB1FuOrgWZoW770zW/J+MS7HB86RNgFOxfhazExPzb7kzXKUyVKZC2J
 RWD4/om6gAWOLrL6/0z8JCfBiS/hJbrz+e3bcq4X0MqrYWD3v6xcYeDEj7x1BMh459z/
 pGBUD4YALkisYO2sUGYZv4c0u5OUB5CcmWZaFcCIE/0mj2uKcSUY/Ag+trNXM8GR8Y9y
 kbyFJmGaL2g6i+IaDaOvetbrwrMWpqBLiEaYAdN4+pJ2xKzYqdflA/3M7XRoSylN4Y3p
 cwfQ==
X-Gm-Message-State: APt69E0FA/1dbB+ooPPu1+yFWDmHb1EjPkG74HJOZKGpAfJJ27n4tNpw
 kBHkD+GUOLMhQtxN1yjvhqchsgOLRVN9QLsj6A==
X-Google-Smtp-Source: AAOMgpdu+QMPTpDosa0vVVeKibAU0ea8qUyPHMDJ8zzx2YmsihrjPZrjufLITOfnx3WZPCb2ODlLqpgZUlhoA2qb1fI=
X-Received: by 2002:a6b:c8c8:: with SMTP id
 y191-v6mr36779929iof.295.1531664503224; 
 Sun, 15 Jul 2018 07:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <a521b9fc-4c10-06c1-fd73-5c64379538f6@yadro.com>
 <bc2d6bd30ce243768d07b2aa5ed9cee4@AUSX13MPC105.AMER.DELL.COM>
 <20180713190320.GB30539@kroah.com>
 <8dfaea969aeb4b0fbd049b4e48389b43@AUSX13MPC105.AMER.DELL.COM>
In-Reply-To: <8dfaea969aeb4b0fbd049b4e48389b43@AUSX13MPC105.AMER.DELL.COM>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 15 Jul 2018 17:21:31 +0300
Message-ID: <CAKKbWA4xBwZJir0DJ+GnXYs+b9bkark4QZO-QxSkKqsRYoQ=yA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
To: Eugene.Cho@dell.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 a.amelkin@yadro.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stewart@linux.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2018 14:21:47 -0000

+ my vote as Nuvoton's BMC FW provider.
On Fri, Jul 13, 2018 at 10:07 PM <Eugene.Cho@dell.com> wrote:
>
> >> Dell - Internal Use - Confidential
> >Really?  To a public mailing list?  odd...
>
> Ha yea sorry - I was so excited to show my support, that I jumped the gun :)
>
