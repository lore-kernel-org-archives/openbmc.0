Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W4A/RiPo"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428K1z0ZkfzF38Y
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 06:11:33 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id g23-v6so10222033plq.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+hirRMNBOLjWC2zW4UvJkTu84ZyAY+SDItfgkpzTc0w=;
 b=W4A/RiPoqfl3KI2mxM4TRcuScJZ5KbqzVlXZBEJ3kDEbTCiHPP9LhT9naBFrXVYHjA
 qP0uQ2Z2Hhu1s++puRHhqVIo1L+ft+W3V65iJRC+qidVCOeWEK9MCkUdawngIKF0jat8
 /TRnuj43yYJ+atuwgWF6GxAJIdCEJ4blJYNZPx7PmETianle3Dz7+6utUPHZpMzDqmrj
 DINWKHGE8ntwKh97DzkV1mXjqHNauTnVcWin/G1uU3KFtTDAnmO4Nfo8eMvrmPMQhLp4
 +JNBfcuub+Go3zSyG8lNC+GR3hbi0V7JtW3THERi+m1XHxnFDjInx85OZSKL87EW32rR
 Ru9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+hirRMNBOLjWC2zW4UvJkTu84ZyAY+SDItfgkpzTc0w=;
 b=pc+q7usVPg1qng5Yx7kQPWZTJ/ek73unWR/tchtONY5TEdWUSpTSHXQUtqGDUb4LsT
 x7sV6VwUYcWL6V1IxgRdYk0mAeI/FGHQbDOmDQD3P+ZpRVUmNZm2vZW1fQYeTaZXpdLo
 d9Pc1vsihI6ZXprcORjRkU9zoHGub//o9r6Q47MbeggrGkY4EjadPFYg6r5wMlVrrSti
 lnLnT+e1NlSUhJYQsJsELVUFxFdMIFNpjHq7oZaJrk15FZV8su9Tyg7aS9LyRocSl7zU
 CpJfWnnNfGiwFYby0HDxkpSwq+zYeSsZ8xqGDnEHibO8i/U6XjfaGmo8sjOnVnhGPiF1
 zOOQ==
X-Gm-Message-State: APzg51CW7kHnzQ3bV9yNXyBQJEkdmYO55BFiwJeCNKw/AO37evEkWdh6
 qM09aHlZeaQ5gOOmYtyVVvVBO7X0+8Bi9/NFe5ivKw==
X-Google-Smtp-Source: ANB0Vdbcp6kaZMIABntZTOlsXJ3e+/Qb2dGDp4RUuFFyc6Rjjt69LhqRN/XMmv0vMiMPzbkpPzbI7plNKe3wFJS/46E=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr24290009pls.53.1536610291831; 
 Mon, 10 Sep 2018 13:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrtk8AMsdTfAszZQozpsMUU-JckZmx6Pa7cvYnyD5cgLzVw@mail.gmail.com>
 <5BCE42E5-A136-480D-846D-7E201AC7734D@fuzziesquirrel.com>
 <20180910195742.GA21308@mauery.jf.intel.com>
In-Reply-To: <20180910195742.GA21308@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Sep 2018 13:11:20 -0700
Message-ID: <CAO=notx0Gq12nxBkf9H7D=B-tJPB6UQoQ-iyZfbh_oZbu_xJMQ@mail.gmail.com>
Subject: Re: C++17 support?
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Sep 2018 20:11:36 -0000

On Mon, Sep 10, 2018 at 12:58 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 10-Sep-2018 09:00 AM, Brad Bishop wrote:
> >
> >
> >> On Sep 10, 2018, at 3:06 AM, Lei YU <mine260309@gmail.com> wrote:
> >>
> >> Now we are using GCC 7.3 and it has full C++17 support, although it is
> >> [experimental][1]
> >>
> >> Is it suitable for a product to use C++17 instead of C++14 in repos?
> >
> >It depends on your tolerance for risk and support structure.  So likely
> >the answer depends on who you ask.
>
> The rework of the IPMI daemon queue/registration/handler stuff I am
> working on is moving onto using c++17 only.
>
> Keep in mind that although the compiler has support for the new c++17
> language constructs, the header library support still has not moved
> everything over from experimental to the std namespace. So even if you
> are specifying -std=3Dc++17 on the command line, you may need to include
> the experimental header files for now.

Sad, but true.

>
> >> So I would like to use C++17 in this repo, which then does not require=
 any
> >> code change to enable LinkTimeOptimization.
> >
> >I don=E2=80=99t have any problem with this.  In fact I much prefer we ar=
e at the
> >bleeding edge.  I know that makes it hard for our users (system integrat=
ors)
> >to be confident but soon-ish we=E2=80=99ll have a stable release for tho=
se with lower
> >risk tolerance.
>
> I like moving to c++17 and would suggest that we urge maintainers to
> move sooner rather than later to catch and differences during
> development rather than during a release cycle.

I've pushed a patch for review in the daemons I help, I think it's a
good idea to give it a shot now.

>
> --Vernon
