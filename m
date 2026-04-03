Return-Path: <openbmc+bounces-1775-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B13FB5175
	for <openbmc@archiver.kernel.org>; Tue,  7 Apr 2026 00:01:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fqRFT4yQbz2yh4;
	Tue, 07 Apr 2026 10:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1329" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775217313;
	cv=pass; b=QF5EWfr5BOwhok87rv3eFM8fjS4Nv+r/Qg9uhk1q9uhEpLcDE3M8HNZQ+VTHZTs8nz+TRmlrfxutCmbQRcjCEFYoenM3NHcGcVM9vC5vuUC7A5/nPdN6TrE4VbeRDLV3bbwY0N8v/FINIJJaMYFh6uc62TUQyRhdkqj1OMBy36gi5+6kPolIZf0uwEnCeG+b+D/bPSAI8lM3rf0/oCOFMGTeAtsvmOWh5gxrNeTHi0u8SdD8+hPs2yfgRQaihAwXvqFbPEyF7X28qe1xKNip9qbVYFJ55hEAhGAlD0yUXUJNQVspUIr9VrnlNIKz3hY6IRxESjlEceXLbHkLmRyYYA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775217313; c=relaxed/relaxed;
	bh=0HkvrkUH7D9BTcVXEfQaGY80ihAP4SloyKmyl9m2abk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=e6a+hAwY19EnAiJbO30fQ2LidVbJ3CgXiH8aZ2tc36P4ojzv5p8tvJFeUhgLk5pkFAVC/i/B7p4XZLVzYADtnfb2h7HjhIwH7CVx52OL0EnnyF685SQABorSqwXYZVZbdZZXGdKnLfH/N0bizo+3MhlVjo7TT1GnCaVg8M92RJFvVp1ViMhSKFR79JMCy1iGtfugb5DosG0JsvihpAq9Kd/Y0YXxVO+0zW6p3BnQwyftDJZHjaSkdXmzi8FhGMImmfOsTZYdX3yC0kBaDcTN2J0wy9bv9vXFLSNvhnsn4D4lACECjZHYV8GTW/wRT9fizgcvlnhar7GfenC1twoaBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EshsUS1V; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=tmanish.in@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EshsUS1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1329; helo=mail-dy1-x1329.google.com; envelope-from=tmanish.in@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com [IPv6:2607:f8b0:4864:20::1329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fnHGR3k8Rz2yVP
	for <openbmc@lists.ozlabs.org>; Fri, 03 Apr 2026 22:55:10 +1100 (AEDT)
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2134222eec.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Apr 2026 04:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775217307; cv=none;
        d=google.com; s=arc-20240605;
        b=lRTlFg2Y5aoFoL+YZB/QdCVstNh2PmBMfjO6zhXHV5h0cMRN2Uwlgp0QTRr082KsL+
         5kf802eOcF+EzhxCuOKIT2AV//yQ5n/9zU/dbxFebxuWDdBd0rwbFDFXMQgi/YPbU9BS
         z5cvqpnNnacJSDzfb7uFQIoWYzNl8WYzgCkDrlsNMllXv/kgM3IThggp4Z1KTlIJb2VU
         bJR4bxetcxgodFFTKsCcn1FdGf+Yc8hkp80DVshit6h5EKJ8NwlKbhQsA8cQ72adLmAx
         Gl4A2NkOj8Kg7wcyLQw6CuwQy4IhDuolK4mxc7x68Y3yWYt8JFE10caYkggCmISZ0wML
         ITjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0HkvrkUH7D9BTcVXEfQaGY80ihAP4SloyKmyl9m2abk=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=YpHm3qDbv/TnaCGo1RMTNxdh64UQmKn5LZboN1O65Ea/h9cn8BD5LuwyolG4CvIhWJ
         i7M+EbWIuZjDKzrYA3SYAGMycDfKi44aTTytkYXRH+NxvW7/L5TJxvMWQ7XeW9ztTlq/
         CPU6p6Q1uuZMmiOCXQP/4pNgZOE4LIE3fP6j4fAulOUddxku2v7lHbIu+V/G+qSe6ltk
         DcBurCArUzP+5T99sVsKpWQ1sqwZ1kmUUrnmCnI+yWuAY6svDX78fjYjiI0Wi6Kj3YVz
         4xmEUTC/NgYLrIf/wOsSqx1g8k/nZBnr18pd9KXWQBNs3z6ENHhkI9H79Bec9EbuWwQv
         OBow==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775217307; x=1775822107; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0HkvrkUH7D9BTcVXEfQaGY80ihAP4SloyKmyl9m2abk=;
        b=EshsUS1VTL3S73+gxDmXViIBjKwEP3tiPY/Xavy0lCy7r+xWWHCq+GYIJKvorTvWrM
         5Fs8UkhJqtmKmStPlPQH7KqoHWMQ0dNN94LpzWOAttvdhKozmQXnIzOGrsv3oZZQ40Af
         4pcD8Oj+sHvX3eDZm5Ck5Fwwvtze9ikaLEyDEe+8OjW851HYn1Ws9YIuJ+MI25guJ85r
         442/iOBJ2Yby9T90KHPVt/h39ccOwm19IkzHkFgAnnBsx4jCP8HUJU/TfVXZgh49ls//
         CKAbhOVxuwIEV12TY2iCGbX/CEFx3+d8PELxXNJyB3ky/09tQZ05II4fRmJQYIOPIEDh
         Oa6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217307; x=1775822107;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HkvrkUH7D9BTcVXEfQaGY80ihAP4SloyKmyl9m2abk=;
        b=bZqxBZHq2dPYn/owz2gyF7uUDgUCs7Z3llxjD2Cwj9IkIeXJWv6ELDKQ+qjyKci8q8
         Rfue+amDJHpUMFIN97B60uvo/EUIjc3pbGhj02Q1QfWu8BbYnkopcrAKgG+2+geSYx8i
         5njIqRo/Ha687rHY21J1LTlMXQWVfXVcqGLmXpDXF0wJKXMtBApWKlxBxAeoewmW3ZvJ
         iePv7Dx545QzEaOg2psvDtm1GTF4BB9PkzfA/k+mYmstkqVyteKDu1GgoADokHCEiMX3
         CfgpxC75Yl9wYsmHzeCSAmwilL50bsGAHA4trXrxqZ+z29cYqp08lPhuG/IlOkYw87Jg
         eGhw==
X-Gm-Message-State: AOJu0YySpGlRH5y1K3DKn9R/QMUVGT4junjRgAGPDR0EGqj5Q3RZdwi2
	7IW7J8wC2QWSqGLq1kjpqhu58IGu+mxc0vEm4hcSblegY/RakBDAuztfLkLA3GLb5wIpA2i+d0v
	oIUC9p0QzyXcJ/siFd9YPClAKbVjlLe9FLvEX
X-Gm-Gg: AeBDiev6aSQ73iyCrKxFtlhrHNxoO5lPV82c+yH16Oe19GfDkpf+rkSADbi5pBKuwFq
	PoiOSsFhwRUl1+hGpfrmqbYc1spBkahD+YJYylnYCa90RDYfspffpyVYFJ/tbwRx43KkXSWwg5x
	bFkh/omcDgY7Yc4QG2DFCQNEiLX1ErRB1MwHTr8+NLQF5n2r/uAE5QZsRCjhGMErj948p3qLuLO
	wgdW94oqxjG11zvSuzzLm5u6xCeX4rGSsBBAvlT2ioz5KuOdSiRtKDirwPp5/0DOuXanDclHqEe
	PYZJN0g=
X-Received: by 2002:a05:7301:1e87:b0:2ba:8018:cc57 with SMTP id
 5a478bee46e88-2cbf9fe1d24mr1190032eec.11.1775217306968; Fri, 03 Apr 2026
 04:55:06 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Manish Tiwari <tmanish.in@gmail.com>
Date: Fri, 3 Apr 2026 17:24:55 +0530
X-Gm-Features: AQROBzBugMLufr7AoiZRehNl8f-2j2kVQ4HswVAa4J2edK0CjaFJekhtJvehjLU
Message-ID: <CAMYVuYj-z4DAo-a+5BVUojfRUC7hS5B-vttOuTc_RcGyEfNT4g@mail.gmail.com>
Subject: Help needed with OpenBMC Gerrit account merge
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000fb26fa064e8cfce8"

--000000000000fb26fa064e8cfce8
Content-Type: text/plain; charset="UTF-8"

Hi,

I need help with an OpenBMC Gerrit account issue.

I have two Gerrit accounts:

   - tmanish.in@gmail.com - old account, which I can no longer log into
   - tmanish.in+openbmc@gmail.com - current account, which my GitHub/OAuth
   login opens

I created the second account because I was unable to access the old one.
The old account does not have any changes, and I would like to merge/link
it with my current accessible account so I can use only one Gerrit account
going forward.

Could you please point me to the Gerrit admin or team who can help with
this?

Thanks,
Manish Tiwari

--000000000000fb26fa064e8cfce8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hi,</p><p class=3D"gmail-=
isSelectedEnd">I need help with an OpenBMC Gerrit account issue.</p><p clas=
s=3D"gmail-isSelectedEnd">I have two Gerrit accounts:</p><ul><li><code dir=
=3D"ltr"><a href=3D"mailto:tmanish.in@gmail.com">tmanish.in@gmail.com</a></=
code>=C2=A0- old account, which I can no longer log into</li><li><code dir=
=3D"ltr"><a href=3D"http://tmanish.in">tmanish.in</a>+<a href=3D"mailto:ope=
nbmc@gmail.com">openbmc@gmail.com</a></code>=C2=A0- current account, which =
my GitHub/OAuth login opens</li></ul><p class=3D"gmail-isSelectedEnd">I cre=
ated the second account because I was unable to access the old one. The old=
 account does not have any changes, and I would like to merge/link it with =
my current accessible account so I can use only one Gerrit account going fo=
rward.</p><p class=3D"gmail-isSelectedEnd">Could you please point me to the=
 Gerrit admin or team who can help with this?</p><p>Thanks,<br>Manish Tiwar=
i</p></div>

--000000000000fb26fa064e8cfce8--

