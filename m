Return-Path: <wangzqbj@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4386Hm4DNQzDqck
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 14:08:01 +1100 (AEDT)
Received: from ([218.57.135.44])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id UPL35251
 for <openbmc@lists.ozlabs.org>; Tue, 04 Dec 2018 11:07:51 +0800
Received: from mail-io1-f41.google.com (172.30.26.1) by
 jtjncas04.home.langchao.com (172.30.26.23) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 4 Dec 2018 11:07:47 +0800
Received: by mail-io1-f41.google.com with SMTP id f10so6548457iop.10
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 19:07:47 -0800 (PST)
X-Gm-Message-State: AA+aEWa94RQbvHfwIXHx8MjrnsyW2nlljst80nEzyJA/eqOBckJuWNuz
 aw5OE9EDQx+Tx+3vRJsl4FvcnBTumrvG2OK8aK0=
X-Google-Smtp-Source: AFSGD/UcSxphDpsHeS6EIKXMqOJOrVkpX71CBv86o9K+Lx5Qz0G3EabKpAZvAkv5SjMQLehbZ+xLUIVTWYKZs01PT/Q=
X-Received: by 2002:a6b:930b:: with SMTP id v11mr15646306iod.148.1543892864784; 
 Mon, 03 Dec 2018 19:07:44 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK0_HJjKrUCsTm69iW2Hyw4QRTYYhVWxDTve5rRaLt7JK5w@mail.gmail.com>
 <CAHkHK0_P2gUHY_aarC2qzcKAxJkw5p4PyC1xO5WxryJs4jMWtQ@mail.gmail.com>
 <52078214-B2FA-4DF2-833E-C1D49B69B280@fuzziesquirrel.com>
 <15D87569-08FD-478E-A5EE-4A09D84D378B@fuzziesquirrel.com>
In-Reply-To: <15D87569-08FD-478E-A5EE-4A09D84D378B@fuzziesquirrel.com>
From: John Wang <wangzqbj@inspur.com>
Date: Tue, 4 Dec 2018 11:07:33 +0800
X-Gmail-Original-Message-ID: <CAHkHK09ecuJTV=eTFDOA8bzgtSuOu9XWVopCS5C9rfaAoZYCuw@mail.gmail.com>
Message-ID: <CAHkHK09ecuJTV=eTFDOA8bzgtSuOu9XWVopCS5C9rfaAoZYCuw@mail.gmail.com>
Subject: Re: meta-inspur repo
To: <bradleyb@fuzziesquirrel.com>
CC: <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.30.26.1]
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
X-List-Received-Date: Tue, 04 Dec 2018 03:08:08 -0000

On Tue, Dec 4, 2018 at 5:06 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wr=
ote:
>
>
>
> > On Dec 3, 2018, at 2:48 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
> >
> >> Hi Brad
> >>
> >> Can you create a meta-inspur repository for a couple of our machines?
> >>
> >>
> >> thanks
> >>
> >> =E2=80=94John
> >
> > Hi John.  I=E2=80=99ve created meta-inspur.  Sorry about the delay.
> >
> > The first commit can be a little tricky
>
> Despite its trickiness, you seem to have figured it out :-)
>
> I found your patch today:
>
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-inspur/+/16293/
>
> Please disregard my patch, and I will have a look at yours!

Brad,
Thanks, I have invited you to be the reviewer.

-John
>
> thx - brad
