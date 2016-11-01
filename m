Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7g8H4YbCzDvNT
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 05:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=KsncLxWl; 
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id x186so78208000vkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=5hPHL9BHpcHVyrcGDDQOwnOVn2vYhOJDBk2opCVqZ6I=;
 b=KsncLxWltUEGxxDZA3E0pSH+c/U4CFG6AizTVLsw1/2mtP8ny5OG8JI+sXeJikiblU
 aNd9uPpF9gueNxo0ndu69gy07lPG/lShP763jIKIcNuurYRUcBHZdJB7+SBG0vY5vcga
 cAPpK9kg2Q5xNYwxgHJXay+xX8qJWgfARxKBVqrG62qMYdH1lJvX9tx40+3NBM49X7i0
 4pM/MCzgCsDzebjDj+ivl+3MET9f0JF7AkJTP8WH0UZnWBfreXZIKV4lgfbSMEr/NICX
 cuHOXAkECKRMt0enAl1xQ5NFv3XC0yudy4HfmD/Zv5+iPY2fYpPfOaVldO8VdxPx6wa3
 Dykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=5hPHL9BHpcHVyrcGDDQOwnOVn2vYhOJDBk2opCVqZ6I=;
 b=bZ8U81+s+LHFUQzhkv3qIRFmsE7+qrlWiR287DaXUN7AfstEzr4rA4in7L/OGDZG96
 Z+WWdeTtuh633ZuGJrbOGJI9B9ktcr1qVw4hlK5Qp8HOIpgT1tIcXr+ET5Y9clYWCtSh
 3hoOd9E3kzYQZTAHcvTfZApTxReuvj9eqxgdcpCSDPydc2sgbwFIFbT0vjaoQwadQ0+z
 LgLvYK3E0vIf5kJpMiuzAeDiw4vqy2ZJylSveKhHFSuaocltLc3p2P4noz+ypyDZ7xgh
 psnVruPKq/uzOdIJRSP12rjskyU8SLtaNMcNtnnJmjrkMUbXRE9Zwi0hx59Tg0u4COP1
 /1fQ==
X-Gm-Message-State: ABUngvdUroLh1QYTgq164mkRn2BD3lWTrM2JCJ5h9fbwZVznh1W4vdRmFSWCYuPypNnQQNq5pF+WWuTGOq1olP4P
X-Received: by 10.31.136.195 with SMTP id k186mr26210202vkd.50.1478025756474; 
 Tue, 01 Nov 2016 11:42:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.102 with HTTP; Tue, 1 Nov 2016 11:42:35 -0700 (PDT)
In-Reply-To: <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
 <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 1 Nov 2016 11:42:35 -0700
Message-ID: <CAFd5g47nnkOqbgWF5DudTAvo0zjMSNRO_zM3zXBeC1huBr=zmw@mail.gmail.com>
Subject: Re: Adding a MAINTAINERS file
To: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11442c702f5ca6054041b08e
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
X-List-Received-Date: Tue, 01 Nov 2016 18:42:40 -0000

--001a11442c702f5ca6054041b08e
Content-Type: text/plain; charset=UTF-8

I would only see a potential advantage for maintainer roles because
reviewers do not have any special privilege to be enforced by gerrit. As
for maintainers, most of them are pretty straightforward so I do not see it
as much of an issue; still, maybe we could add a hook into gerrit for this?
I still like not needing to use gerrit to see who people are as the update
process is more transparent and so that someone who just wants to ask a
question or file an issue does not need to visit gerrit.

--001a11442c702f5ca6054041b08e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would only see a potential advantage for maintainer role=
s because reviewers do not have any special privilege to be enforced by ger=
rit. As for maintainers, most of them are pretty straightforward so I do no=
t see it as much of an issue; still, maybe we could add a hook into gerrit =
for this? I still like not needing to use gerrit to see who people are as t=
he update process is more transparent and so that someone who just wants to=
 ask a question or file an issue does not need to visit gerrit.</div>

--001a11442c702f5ca6054041b08e--
