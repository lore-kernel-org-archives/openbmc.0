Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dptytDQI"; 
 dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VbRY4xQczF14b
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 01:03:37 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id d14-v6so5728855qto.4
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmQLD92esnN3OKWVVgCicnL9NwpUu+xTQIue3GbZ/1s=;
 b=dptytDQIK5fZKABTCY+FKgGJwa00H+zqeromn1UNOP7fC+TUXBpvCt6JfnchCdgwxL
 GSAk+Bl9/lmLRtnS77v8Xnw17r+yCMJXM1F8r1/BCxqlb4OJ7TGFCIerrW9z1DAIArS+
 t8+kqpn5chp8vMRzuzsFsLWqYP4uwpoe2RQ+oU+XZIE6PHqST8S3oDYQhixaUeCn6y0M
 +BRWcsZnFrIYJnzdnhbxreILdcmYPQr5CVR60jSxRTGzg49g+VsMb+G12txjhfh7/AuY
 y66A7lt1DA34p8vUGKCNhiix6QBAoH78pPwLqa5BtX2QBM5JF9cs0iAGbON/p3pP3pnA
 v1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmQLD92esnN3OKWVVgCicnL9NwpUu+xTQIue3GbZ/1s=;
 b=Iqk9tKzmzk7QgbbvdMFpfVMYcxkQ5tXUCNABESVGNKELhI5n17t/vYxoqruBtjlNuv
 o3STNsx0nYw8q+kxtCtE4B216jWfcyiDVv+IKYAM38cEXQACESPaR5dssYUdDJzQK5tl
 9QA626uBUSpl6fSfCR31JK1O9Lri/quet8kvKSHzVqOS+pWiw1b+1N3j6qI2ki68Z9R+
 26ms1uHVYP2O58eqcTop7zXEEPdnUDjZnA7RGxNWkq7U6/diMJxSUGnAH0Vi29puVNSS
 SDAxysA1yC9c3gX/0pPtE8KTxAexeaJ5+3osggs5Ykvl2MtlyTL3bi5H9XhEXtJ59z4d
 IqxA==
X-Gm-Message-State: ABuFfohyLYLqrlHP9hhJTTEVocL1DIGB74sCK9SMYJwYIqSlM6jVihVU
 ufdDbJQ2R1eHfHNMrfe9olbg/yLwofb8+EytJQZcGQ==
X-Google-Smtp-Source: ACcGV6378PzcmnumjYYfvpLAFdiIY38vTs0WfenTNivgpqSI2i+P+YxUv0qsDbrAEkEzlw/RLyeUDINmmQS7csLClRc=
X-Received: by 2002:ac8:5508:: with SMTP id
 j8-v6mr27270041qtq.139.1539180213360; 
 Wed, 10 Oct 2018 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <CA+YB3rbDhYE158AVgQU+x8DKZFCx+y0SpA2LBJaKV059UVv0VA@mail.gmail.com>
In-Reply-To: <CA+YB3rbDhYE158AVgQU+x8DKZFCx+y0SpA2LBJaKV059UVv0VA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 10 Oct 2018 07:03:20 -0700
Message-ID: <CAJoAoZkciunudN6tW=GZa0w0Andj2WwiH6rpRr5AnWVMPGiKNA@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Jeff Osier-Mixon <jefro.net@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000dd62f00577e05117"
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
X-List-Received-Date: Wed, 10 Oct 2018 14:03:38 -0000

--000000000000dd62f00577e05117
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 11:53 PM Jeff Osier-Mixon <jefro.net@gmail.com>
wrote:

> You are absolutely right to ask these questions, and I'm sure each
> community will want to fine-tune it, although as a community manager I
> actually prefer some of the vagueness in it. It is normal to add to a CoC
> to try to cover all the bases, but people will always think up ways to
> violate the spirit of the rule while staying within the letter. For a
> positive community (like openbmc) the CoC is a guideline for new users,
> rather than legislation for behavior, as it should be.
>

As long as we're aware that there's a line to tread with the vagueness, I
don't mind. IMO one of the points is to highlight to community members what
is and isn't abusive language, so having a code that's too vague opens the
door for a victim to be gaslit out of realizing there is a problem going
on.  I don't feel that's an issue with this Contributor Covenant.


>
> The best offense is a good community manager who can set the tone, with an
> escalation path to a TSC or governing board, whichever is appropriate for a
> given community. Ideally it would never be used - it never has been needed
> in almost 8 yrs of the Yocto Project, as the leaders simply set a tone of
> respect.
>

+1000. Like I said at the outset, I don't think this is to address a
problem happening now, so much as it is to codify our current positive
culture and cover ourselves for later.


>
> That's a really good question of harassment outside. Technically it is
> private conversation, or outside the project's boundaries. If I were
> community mgr in that case, I would have a frank conversation with the
> harasser and let them know that simply isn't the way escalation is done in
> this project, then provide the proper way and make sure their concern is
> answered while respecting both sides. That being said, being hands-on
> doesn't scale up to thousands of participants.
>
> One more tidbit - this is the same CoC adopted by the kernel community and
> several other high profile communities, so there is precedent within the
> wider open source community for it. One thing I like quite a lot about it
> is that it is itself open source - if I find a bug with it, I can submit a
> pull request to the CoC itself.
>
> I hope this is helpful to the process and not disruptive  :)
>
>
I've got a copy of the Contributor Covenant up for review in docs/ now:

https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/13920/

Happy to continue discussion in both places.

>

--000000000000dd62f00577e05117
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 9,=
 2018 at 11:53 PM Jeff Osier-Mixon &lt;<a href=3D"mailto:jefro.net@gmail.co=
m">jefro.net@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr">You are absolutely right to ask these questions, and I&=
#39;m sure each community will want to fine-tune it, although as a communit=
y manager I actually prefer some of the vagueness in it. It is normal to ad=
d to a CoC to try to cover all the bases, but people will always think up w=
ays to violate the spirit of the rule while staying within the letter. For =
a positive community (like openbmc) the CoC is a guideline for new users, r=
ather than legislation for behavior, as it should be.</div></blockquote><di=
v><br></div><div>As long as we&#39;re aware that there&#39;s a line to trea=
d with the vagueness, I don&#39;t mind. IMO one of the points is to highlig=
ht to community members what is and isn&#39;t abusive language, so having a=
 code that&#39;s too vague opens the door for a victim to be gaslit out of =
realizing there is a problem going on.=C2=A0 I don&#39;t feel that&#39;s an=
 issue with this Contributor Covenant.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div><br></div><div>The best offense is a=
 good community manager who can set the tone, with an escalation path to a =
TSC or governing board, whichever is appropriate for a given community. Ide=
ally it would never be used - it never has been needed in almost 8 yrs of t=
he Yocto Project, as the leaders simply set a tone of respect.=C2=A0</div><=
/div></blockquote><div><br></div><div>+1000. Like I said at the outset, I d=
on&#39;t think this is to address a problem happening now, so much as it is=
 to codify our current positive culture and cover ourselves for later.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>=
<br></div><div>That&#39;s a really good question of harassment outside. Tec=
hnically it is private conversation, or outside the project&#39;s boundarie=
s. If I were community mgr in that case, I would have a frank conversation =
with the harasser and let them know that simply isn&#39;t the way escalatio=
n is done in this project, then provide the proper way and make sure their =
concern is answered while respecting both sides. That being said, being han=
ds-on doesn&#39;t scale up to thousands of participants.</div><div><br></di=
v><div>One more tidbit - this is the same CoC adopted by the kernel communi=
ty and several other high profile communities, so there is precedent within=
 the wider open source community for it. One thing I like quite a lot about=
 it is that it is itself open source - if I find a bug with it, I can submi=
t a pull request to the CoC itself.<br></div><div><br></div><div>I hope thi=
s is helpful to the process and not disruptive=C2=A0 :)</div></div><br></bl=
ockquote><div><br></div><div>I&#39;ve got a copy of the Contributor Covenan=
t up for review in docs/ now:<div><br></div><div><a href=3D"https://gerrit.=
openbmc-project.xyz/#/c/openbmc/docs/+/13920/">https://gerrit.openbmc-proje=
ct.xyz/#/c/openbmc/docs/+/13920/</a></div><div><br></div><div>Happy to cont=
inue discussion in both places.</div></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>

--000000000000dd62f00577e05117--
