Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3gMl73r8zDq68
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 10:38:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VWOSma4d; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id 77so81460613pfv.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2016 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QIub9ELpUwD5DSU5rotSkbxAlgKJa7JCzoKcP3mLbYs=;
 b=VWOSma4dooKc16oL2m+IpTE449Y9L0xY2yKFL/QU2ZcZLaRAG3EGVf+y29tUrPn+7O
 Fb5JP/LxKcCOuH1pks3L10fCyOusjf8ihyds5bzvGiqamJQA/f+fstExwuBuLyXyHVuh
 ymulxKolKgPKxtsLAZvRPgPf0/4hXPJNDpWGERVw/GWK61mBaOX6R0YRi56KArVBdJIb
 O40rT9INyzFYv1cxo3cIBPise5ph9UceZ55lECldtZABwg96kSCxxmcN7j325TbZSp8L
 iCPJDNoUi+Gnx2KA/O14UosoEHBwTpfalDy2GhnnbzgjIRrjj/4VnWa0fOONlMKd6X66
 12zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QIub9ELpUwD5DSU5rotSkbxAlgKJa7JCzoKcP3mLbYs=;
 b=U7Z9YmIK9PUnRPlwBMHwFidBowkNo1eJ5ME063jDP6WcLgOHykPDSgTlkBmdPIv1PN
 DvejQkd1mVR2j739zpSGC+lAZtudP2miyomJHKyODn1ew4is276oF8IF5gpSmzof2z3U
 DlnpnayKaqf3AQybHQex+lvKUCHxEyS5HN/RctnDpZcs11p8c5FBNMaD3ZmJ+Cpj8YZe
 itmACz1oZueeI6iy7HAybAMsjsdVwmG2nq6bx3xYT5pQvxDqUBbKTNmMrCwZFWqec0NM
 y8zZZF9r3rxGdL267nFakx8H9lXgOnZ335BGKP/xRl76uOFs0NhTrPZn1e4mWvUGHkb8
 Sypw==
X-Gm-Message-State: AOPr4FUQqSpkTnEUj2sEd2Hpe2rtv8fvteMDli1mUv+fx5+qgaZojGIW0VfzP5Ne/w8vAQ==
X-Received: by 10.98.1.202 with SMTP id 193mr16728473pfb.10.1462840689560;
 Mon, 09 May 2016 17:38:09 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id p187sm18528563pfb.3.2016.05.09.17.38.06
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 09 May 2016 17:38:09 -0700 (PDT)
Date: Tue, 10 May 2016 10:38:00 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: "Sertac Cakici" <cakici@us.ibm.com>
Cc: benh@ozlabs.au.ibm.com, "Raguraman Tumaati-Krishnan" <ragu@us.ibm.com>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
Message-ID: <20160510103800.730f98fa@camb691>
In-Reply-To: <201605091951.u49Jp4Yc017604@d03av05.boulder.ibm.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com>
 <20160506113218.4adf5db7@camb691>
 <1462578052.20290.61.camel@au1.ibm.com>
 <201605091951.u49Jp4Yc017604@d03av05.boulder.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 00:38:12 -0000

On Mon, 9 May 2016 14:51:00 -0500
"Sertac Cakici" <cakici@us.ibm.com> wrote:

Hi Sertac,

I got access to fr112 and only managed to get tftp booting going on it
yesterday, all good though, I've tested what I need. Interestingly on that
machine networking behaves as we expected and Gavins workaround isn't neede=
d.

I know this is a long shot but do you know how our firestones in Canberra (=
which
are clearly pre GA) might differ?

Thanks,

Cyril

> Ragu has let us borrow his system. It's GA level HW.
>=20
> BMC: fr999.aus.stglabs.ibm.com
> Ubuntu: fr999p01.aus.stglabs.ibm.com
>=20
> Serta=C3=A7
> =E5=8F=B2=E5=A1=94=E5=A5=87
>=20
>=20
>=20
>=20
> From:   Benjamin Herrenschmidt <benh@au1.ibm.com>
> To:     Cyril Bur <cyrilbur@gmail.com>
> Cc:     Joel Stanley <joel@jms.id.au>, OpenBMC Maillist=20
> <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>, Serta=
c=20
> Cakici/Austin/IBM@IBMUS
> Date:   05/06/2016 06:42 PM
> Subject:        Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
>=20
>=20
>=20
> On Fri, 2016-05-06 at 11:32 +1000, Cyril Bur wrote:
> >=20
> > This is something I'm trying to confirm. The firestones I and Gavin
> > have access to appear to be prerelease, so anythings possible.
> >
> > I am struggling to get access to a release firestone, when I do I'll
> > check if Gavins patch is necessary there. If so, then we'll have to
> > start asking those sorts of questions. =20
>=20
> So I talked to Sertac and he'll get you access to a GA level Firestone
> next week. It should be wired as proper RGMII, ie, it shoul work...
>=20
> Cheers,
> Ben.
>=20
>=20
>=20
>=20
