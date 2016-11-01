Return-Path: <raltherr@google.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7YgJ06LDzDvJX
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 01:35:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=oPV1UztO; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id r204so70057810ywb.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4ph8nW2gUdViU2upXepG1EmEoFzBkaDg4CVthWL7XfQ=;
 b=oPV1UztOR5rumQB8Q7qnwjt/Lmfc9fgyWQEyDa0x8iruXudMZUX12yWE7yAVe+OfiZ
 4klwFmN1Nfivc10Wa7K4Nwo46cwzbmucmE0/hGyZMETbJOKIgrxko2hbigljd8WxQw9m
 dEqe5Kl29wGNtUgxwtMhBhKqbF/7oi57jphvr7YA2nTKCduBnSfGcakoEUHy1QEx4fiB
 eWSEXMLVdz4blYbhA9OS2N+3r00nm5k/iDpwmsTYusEE2LWmIdzWOaUhB+RA9JjHzpQR
 H1jWrSSBwA1W0DBDokNFsk9FIB1YLyrriu0Ije1MHZgCy08Wjc3sr571y5UQO1Pq2TOL
 1Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4ph8nW2gUdViU2upXepG1EmEoFzBkaDg4CVthWL7XfQ=;
 b=UL1SXPtLg86jjioxCHvWVYZOhueBz6AjsPypLpasX+vDsn7Gt8AxW1R0yApryVgKd+
 njUFtqFQIfMN87wbprNs3X/IYQsssgoRexctpZWbckIYh6vtSaE7SIgE9e01ajfI6OUc
 NaiBVutonztGB7d8GiY446CvUsxYJQqzddC/IbmEAfeSuXhonUAMoe/4yn1sngSo5R+v
 YoeHmxWO486ZfnRCeSp6QTviUntQ57uxO+m2bZmSAW9p7LlUZItsJxDtDNQ00PaqlkNp
 zu+bMCKPCvaLPXyhO3SnLmNDeABZfso4r0t3fHrf7umk88gghdUO9dK8VecGV0eI+AKQ
 h0pQ==
X-Gm-Message-State: ABUngvfE3OlgHqHADWVtBv3KFrMb3w0LYNX3wXog0fItbQHx+KeizlWwXO8ySgF0TaZbouxvGEILrp7Httm7Hz0K
X-Received: by 10.13.220.69 with SMTP id f66mr29529128ywe.112.1478010936926;
 Tue, 01 Nov 2016 07:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
In-Reply-To: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 01 Nov 2016 14:35:26 +0000
Message-ID: <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
Subject: Re: Adding a MAINTAINERS file
To: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0815c8df8e7005403e3c4a
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 14:35:40 -0000

--94eb2c0815c8df8e7005403e3c4a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Brendan. Given the projects usage of Gerrit for most of repos, would
there be an advantage to using Gerrit to enforce the reviewer and
maintainer roles? How will we prevent MAINTAINERS from getting out of sync
with commit privileges?

On Tue, Nov 1, 2016, 1:04 AM Brendan Higgins <brendanhiggins@google.com>
wrote:

> For those who were not present, there was an OpenBMC meetup of sorts
> last week. One issue that Nancy Yuen, Abhishek Pandit, and myself
> brought up for non-IBM contributors was ownership and organization of
> projects; this went in a couple directions, but at some point somebody
> proposed a Linux kernel style MAINTAINERS list as a way to find people
> relevant for discussions in the various sub-parts of the project.
>
> I made an initial implementation:
> https://gerrit.openbmc-project.xyz/#/c/944/
>
> Most of it should be pretty self-explanatory (if not please join in
> the discussion). Nevertheless, I distinguished between reviewers and
> maintainers; whereas a reviewer is someone who is familiar enough with
> a given part of a project that she is a good person to address
> questions to concerning that component and should be included on code
> reviews; a maintainer is someone who's approval is required to check a
> patch set into a repository.
>
> I chose reviewers based on the amount of commits contributed to a
> given repository; I know this is not the best way to decide whether
> someone should be considered an expert on a particular part of the
> code base, but I thought it was a reasonable place to start.
> Additionally, breaking things up only at the repo level is probably
> also not the most useful as people may become experts within a
> particular part of a given repository, but again I think this is a
> reasonable starting place and I added semantics for breaking it down
> further.
>
> For maintainers, I chose two people for each repository; the first is
> the person who already has the authoritative access I described above;
> the second was chosen to be a major contributor. For Linux, u-boot,
> ipmi-tool, and qemu that is some combination of Joel, C=C3=A9dric, and
> Jeremy. For everything else, all of the userland stuff and yocto, that
> is Patrick and Brad. I recall discussing adding Brad as a maintainer
> for the userland stuff in the meeting, but I figure it is something we
> should also discuss on the email list for everyone's benefit. We had
> not discussed adding a second maintainer for anything else, but I
> figure it is probably best practice to have more than once person who
> can submit code in all cases.
>
> I fully expect that the MAINTAINERS file I uploaded will require a
> good deal of discussion before it is ready to submit, but I figured it
> would be easiest to start with something to talk over.
>
> Cheers
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c0815c8df8e7005403e3c4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Thanks Brendan. Given the projects usage of Gerrit for most =
of repos, would there be an advantage to using Gerrit to enforce the review=
er and maintainer roles? How will we prevent MAINTAINERS from getting out o=
f sync with commit privileges?</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Nov 1, 2016, 1:04 A=
M Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins@google.com">brendanh=
iggins@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fo=
r those who were not present, there was an OpenBMC meetup of sorts<br class=
=3D"gmail_msg">
last week. One issue that Nancy Yuen, Abhishek Pandit, and myself<br class=
=3D"gmail_msg">
brought up for non-IBM contributors was ownership and organization of<br cl=
ass=3D"gmail_msg">
projects; this went in a couple directions, but at some point somebody<br c=
lass=3D"gmail_msg">
proposed a Linux kernel style MAINTAINERS list as a way to find people<br c=
lass=3D"gmail_msg">
relevant for discussions in the various sub-parts of the project.<br class=
=3D"gmail_msg">
<br class=3D"gmail_msg">
I made an initial implementation: <a href=3D"https://gerrit.openbmc-project=
.xyz/#/c/944/" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">htt=
ps://gerrit.openbmc-project.xyz/#/c/944/</a><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
Most of it should be pretty self-explanatory (if not please join in<br clas=
s=3D"gmail_msg">
the discussion). Nevertheless, I distinguished between reviewers and<br cla=
ss=3D"gmail_msg">
maintainers; whereas a reviewer is someone who is familiar enough with<br c=
lass=3D"gmail_msg">
a given part of a project that she is a good person to address<br class=3D"=
gmail_msg">
questions to concerning that component and should be included on code<br cl=
ass=3D"gmail_msg">
reviews; a maintainer is someone who&#39;s approval is required to check a<=
br class=3D"gmail_msg">
patch set into a repository.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I chose reviewers based on the amount of commits contributed to a<br class=
=3D"gmail_msg">
given repository; I know this is not the best way to decide whether<br clas=
s=3D"gmail_msg">
someone should be considered an expert on a particular part of the<br class=
=3D"gmail_msg">
code base, but I thought it was a reasonable place to start.<br class=3D"gm=
ail_msg">
Additionally, breaking things up only at the repo level is probably<br clas=
s=3D"gmail_msg">
also not the most useful as people may become experts within a<br class=3D"=
gmail_msg">
particular part of a given repository, but again I think this is a<br class=
=3D"gmail_msg">
reasonable starting place and I added semantics for breaking it down<br cla=
ss=3D"gmail_msg">
further.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
For maintainers, I chose two people for each repository; the first is<br cl=
ass=3D"gmail_msg">
the person who already has the authoritative access I described above;<br c=
lass=3D"gmail_msg">
the second was chosen to be a major contributor. For Linux, u-boot,<br clas=
s=3D"gmail_msg">
ipmi-tool, and qemu that is some combination of Joel, C=C3=A9dric, and<br c=
lass=3D"gmail_msg">
Jeremy. For everything else, all of the userland stuff and yocto, that<br c=
lass=3D"gmail_msg">
is Patrick and Brad. I recall discussing adding Brad as a maintainer<br cla=
ss=3D"gmail_msg">
for the userland stuff in the meeting, but I figure it is something we<br c=
lass=3D"gmail_msg">
should also discuss on the email list for everyone&#39;s benefit. We had<br=
 class=3D"gmail_msg">
not discussed adding a second maintainer for anything else, but I<br class=
=3D"gmail_msg">
figure it is probably best practice to have more than once person who<br cl=
ass=3D"gmail_msg">
can submit code in all cases.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I fully expect that the MAINTAINERS file I uploaded will require a<br class=
=3D"gmail_msg">
good deal of discussion before it is ready to submit, but I figured it<br c=
lass=3D"gmail_msg">
would be easiest to start with something to talk over.<br class=3D"gmail_ms=
g">
<br class=3D"gmail_msg">
Cheers<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
openbmc mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:openbmc@lists.ozlabs.org" class=3D"gmail_msg" target=3D"_=
blank">openbmc@lists.ozlabs.org</a><br class=3D"gmail_msg">
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" cl=
ass=3D"gmail_msg" target=3D"_blank">https://lists.ozlabs.org/listinfo/openb=
mc</a><br class=3D"gmail_msg">
</blockquote></div>

--94eb2c0815c8df8e7005403e3c4a--
