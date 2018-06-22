Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c05::241; helo=mail-vk0-x241.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BssPdsws"; 
 dkim-atps=neutral
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41CB9X0NxnzF143
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jun 2018 07:12:47 +1000 (AEST)
Received: by mail-vk0-x241.google.com with SMTP id w8-v6so4697328vkh.4
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+gnDHFXEG1OauwesNTNMa4pXgfkDngHqaRp91YTfY7U=;
 b=BssPdsws/VJ04MzVUfEWheD73jo117bEt0xqBHE0fuz/Jb9LjF94R5yq1TWFNABOjZ
 ZM6EfN8/OPRwE9zTV11lFPMi4jpTZIZW2PTnyWUPk8pVRgk3fHNLriSOWPZ1A6Hq1fgC
 wQHu4J0w5EtfQ0WcydXcDoE5cJHhiO6h5llPyQNIzI7htjAkUmZjE45rsICfbfqidu78
 ft5PwhFFDd3FSZg17FiCCf3B8+vkbfWc7/H7yw/C3zHF622rRMt4lczmr/LO2/QkBExu
 HfwarhRImJyHx/8m+B6rrASOm2hb805YUU3ZTs1ID3iVlg5eXJ3KxFMhVoMyCxMAeNzF
 a8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+gnDHFXEG1OauwesNTNMa4pXgfkDngHqaRp91YTfY7U=;
 b=bJPz14X/cK8duI5nHzzzbDXTKK/WUut+OBdSeZdLlgTNjElx4lj3ecpX5GyeP0wpgl
 M2VOLSywtkK0jyN49XIAEUHZN94P650Ql1rMVZj7v6yqEBZaL77fdHJf+bd56neMyWDJ
 OesCPs7bDKdotksQZ4k5mKfIbv26tpvjd+Uy4y29gMSfh4BffsJlBnpGTQUQE6m3w6m9
 /4ELGr8JDj2g9K8mnUTh2F+KhuXB+VeKyRhcBV3KwqkEFC7g1S0gcLu2/8A7Hnq1ZAY+
 EwCN6HRP1ZxawDp2oiXOsYFC7nC7LXguKxEU/S0xJvNF5JZhXtBfLXjUD5smPj66/iu3
 pZYA==
X-Gm-Message-State: APt69E1E9COy3ZMYWZxFKIjZb/rK9P/sE94+ca9cOS8Xh4nzUGkvALdN
 31hR5+7+8M4iFkWBuVDXbnE6qZIB0J4Hff228zw=
X-Google-Smtp-Source: ADUXVKLSIUzqrdtn0ApxsbbpKvSakDs/z3Yma+TEBRA2Aa4l2abOjSCeKmYTFlmumLBRz55OdYO+yNNJ9A2KmGvLcqI=
X-Received: by 2002:a1f:a285:: with SMTP id
 l127-v6mr1994300vke.95.1529701964400; 
 Fri, 22 Jun 2018 14:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
 <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
 <1527820565.499695.1392530280.7147CEB3@webmail.messagingengine.com>
 <CAMKF1sr-k=TK-wyUtDJMUT8DK=EcS3A08jCJD-xjOD_Aw-MbQw@mail.gmail.com>
 <1527832326.1573871.1392638136.4D3CA167@webmail.messagingengine.com>
In-Reply-To: <1527832326.1573871.1392638136.4D3CA167@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2018 14:12:28 -0700
Message-ID: <CAMKF1soLpEszGdDS=on=kd82k8cDWx68jwCr6+-s9UU9zePv4A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 21:12:48 -0000

On Thu, May 31, 2018 at 10:52 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Fri, 1 Jun 2018, at 14:07, Khem Raj wrote:
> > On Thu, May 31, 2018 at 7:36 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > > Hi Khem,
> > >
> > > Thanks for testing.
> > >
> > > On Fri, 1 Jun 2018, at 02:18, Khem Raj wrote:
> > >> fails to build on qemumips
> > >>
> > >
> > > Do I have to support MIPS for the recipe to be acceptable? Is there s=
ome way we can limit the recipe to architectures for which the software is =
known to work?
> >
> > Ideally we tend to support the core architectures and mips is one of
> > them, so unless there is a very basic
> > reason e.g. missing support etc. we tend to fix the problems,
>
> Doesn't the fact that the source doesn't build indicate missing support?
>
> I don't know what C library you were building against, but glibc for mips=
 doesn't contain a definition for struct user_regs{,_struct} in sysdeps/uni=
x/sysv/linux/mips/sys/user.h. It's a bit nasty, as the header very clearly =
states that user.h is purely for gdb, but pyflame is making use of it anywa=
y. Patch 2/3 fixes the pyflame source for 32-bit ARM, where the struct has =
a different name, but at least it's present. I haven't investigated whether=
 we could pull in the appropriate header from the kernel instead of libc, b=
ut again because ARM can be made to work with relatively little effort I ha=
dn't bothered.
>
> > so I would suggest to see if it can be fixed preferably
> > if not then we should cite the reason and probably we can add mips to
> > incompatible hosts but that is last resort
> > once a recipe goes in it becomes a maintenance work and I would like
> > to make it as light as possible.
>
> I could go down the path of working this out for mips, but fixing mips fa=
lls outside the scope of what I was doing at the time (I'm several yaks dee=
p here), and given the problem is external to pyflame itself I'm not terrib=
ly motivated to fix it.
>
> So I feel at this point it's either blacklist mips or we leave the recipe=
 out of tree.
>
> As an alternative to making mips work, can I assist with the associated m=
aintenance hassle in some way?
>

we can add it with exclusions for mips/musl and I think we will have
similar problems with ppc as well but I do not have test results for
that

you should report this issue upstream and probably add a comment so
we remember why it was excluded.

> Cheers,
>
> Andrew
