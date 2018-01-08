Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::232; helo=mail-qk0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJdeXfG4"; 
 dkim-atps=neutral
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFr1h5KbrzF0dL
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 09:44:40 +1100 (AEDT)
Received: by mail-qk0-x232.google.com with SMTP id d202so16250493qkc.9
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jan 2018 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WDEEaKFTE590qC9vb00hBHszkqcouWs8MsH1IBtNO5w=;
 b=lJdeXfG4x+GRduUZFPv32lXWO20YzDR9ISuSGOkkyRd4PZmOCrVkiCvaAv2mBdrpLR
 4FkvGHo1IBXAkl52Z2pmAWfeRrCag7Rgqd63T1vVFzI6+Q4PeKdbvKlCnv1hWSiNneGZ
 3oPKynQiC+RFv38J6LqoyYlOumfGMcGQB8U+fyHKr81B9sNVxu/JUbZvU1IX+lZivWdD
 4YXCMR7lBmOXU6ykDO6vNkOe98cIkPFHRMKXNBpnfxCQwd2uAtL2oNAv2viktoi2xc/7
 RxQ2wugxYDjtNU3wJLWJMJmPo4AD90lIZS+9sgNYRFNzhKLmB2Na4b7nvrKRFLgmlY2I
 Vr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WDEEaKFTE590qC9vb00hBHszkqcouWs8MsH1IBtNO5w=;
 b=aBTEg6zGDSLCp7xta4Gqfq6b2rapuA74+VlKwOcYajkqRp0euNrrWRlWBK5NRhpSTx
 eejmTwgIN7/fJkZatW9iH922FoZZgadDpSkK4YE2F7lc3JgxwD62X0MrH+Z6CWY7KKnn
 LbIK2dEp+tiP4t1iWMHmpQgm64tDvEcKmDpVGvY42XEQ3EDmmc3lrjkvxWaiL9yhUcPw
 D0AKiOdLWJdxjEul5Dn4NFs0FEVAh0bWqppB4iuhntDUuahnWB30lHIoqMuiRcbVxDVh
 AqQxpcB/p7/W9nuBVWNRI+mtzZp2vrmVvP9wl2bmWerBbArfI5sMI6Uswqdn9+c/nk4o
 K/CA==
X-Gm-Message-State: AKwxytcEkgcZ5UPaBypr/Xng112xFzZSP4nyast7LeVMq90IXFr2HujE
 A+LI4RwdcZBmfqkVMFI8LOfdgOM1Jk7I3DZA/lM=
X-Google-Smtp-Source: ACJfBovQvn1MvI4p5lcq89SWS6ZQmOKMfXgQVTZrj+LO9fwCQ8oFUjew1yycWmRPe3VLD9tCOv8dazBoz1Vnqiirp/A=
X-Received: by 10.55.217.20 with SMTP id u20mr17569540qki.52.1515451478229;
 Mon, 08 Jan 2018 14:44:38 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Mon, 8 Jan 2018 14:44:17 -0800 (PST)
In-Reply-To: <4d8698c2591544cb98b06faa527935b2@ausx13mps334.AMER.DELL.COM>
References: <4d8698c2591544cb98b06faa527935b2@ausx13mps334.AMER.DELL.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jan 2018 09:44:17 +1100
X-Google-Sender-Auth: BgpieXGmfbL5UdYkZ80BMOPkRss
Message-ID: <CACPK8XdhQT0_HvAwsNsY=Pv7_BMMDyDKXf4CFbK4jHR9LpdUNw@mail.gmail.com>
Subject: Re: NonRoot discussion at Hackathon - call for input
To: Michael.E.Brown@dell.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jan 2018 22:44:41 -0000

On Tue, Jan 9, 2018 at 5:35 AM,  <Michael.E.Brown@dell.com> wrote:
> Hello (again) to everybody going to the hackathon. I=E2=80=99m currently =
scheduled
> for an hour talk on Thursday on root/nonroot security.
>
>
>
> What would be the best way to make this hour the most productive hour we =
can
> have on this topic?
>
>
>
> My background: I led the conversion effort for Dell IDRAC to move our ent=
ire
> infrastructure away from running daemons as root, and instead run each
> daemon under a distinct user account.

Great! I have had this as a goal in mind for OpenBMC since I started
working on it.

> I provided technical backstop as
> individual teams took over the efforts for their daemons and provided
> training and design support to ensure that the effort went as smoothly as
> possible. Our currently shipping Dell IDRAC has most of this work present=
 in
> our shipping product, with a few remaining daemons rolling into upcoming
> releases.
>
>
>
> What I might suggest would be helpful:
>
> -          Slides on examples

Some documentation for others to use when adding daemons to the system
would be a great start.

>
> o   Running daemon
>
> o   Setting up user accounts for daemons
>
> o   Setting up tmpfiles rules
>
> o   Setting up DBUS security
>
> o   Udev rules to set up /dev/ permissions and ownership (if needed)
>
> -          Hands-on: actually hacking live on some daemons to try to get
> some converted to non-root

This hands on stuff sounds great. I am more interested in hands on
keyboards than viewing slides for our sessions this week.

Cheers,

Joel
