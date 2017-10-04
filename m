Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::235; helo=mail-lf0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdgBw+2q"; 
 dkim-atps=neutral
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6Nqk4YtlzDqlC
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 15:54:58 +1100 (AEDT)
Received: by mail-lf0-x235.google.com with SMTP id n140so9734672lfn.4
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 21:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CqCYZjCJthIKWAMh23h9C4hwWknodsm7J7MHJsaMINE=;
 b=fdgBw+2q909KUUggh8cybvRnqqrECjkAGSYuAQ5wj0mPbs/sUtPeYoaOkpYmrdNnf8
 ZkO1fKMeESXsUmKXzg0pc3bqXyiRSSQYAqTK31HjGsa8lbPsMDXQGm3yW6TreuZYfgyF
 F7ASkbthqC8uwhJNx0wRkJH5+EWnipp7sIGnuuGpAxhBeHm72RAgmy/qSW2iTjGo26cQ
 9Kk7AM8ZOt0T/cXu5agOiq+tpU+4ZdB/+QJQPvU0KyI4spXkneVn4bNFmGY8QW7IyAsy
 KdAWoArIeVah+JgKYqrBgzEtHdTH0kwOBfeUuKz7/4/yT7G8vAXO2cOFfk9Nnv6GTc9F
 KW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CqCYZjCJthIKWAMh23h9C4hwWknodsm7J7MHJsaMINE=;
 b=gzdWDkXFxiw0Jh5pTYA1OtkfINyiyctOb/8sHiogLPML/lgcQ99zojGqnzf+5bT3uG
 XTJH5gibDDDuWwioUwcxZcNtkyxo4BY8aZfZc7fEfbFTJTZwa0+45GqZrD7pnMGBUwj5
 84Mp7rDRDl8kXNzFuPeWj+s9uQ4e+J6yyxRu7VY5lkbKt1qk46z9PxcA+zTVMpJ3MZtt
 ghdcsU5CV6t/3I1EorBbD8mkt75hqIbu0d2lHew2fEsig/2AwZrwUfMqCsqe7trHUM4A
 mWYrvMFjooUxBCo5ibfdc7+wpIeAUGGvz6ozBBylLnM7LIGUkOAbFhrYXI/kn/+4M4h0
 3C9w==
X-Gm-Message-State: AHPjjUhopHyS/CBuAZykWFXBu/MHUX0CFTKc+CeWuPA654X650aZxiI6
 2BcjfAIlMzyddh5lUeaMJGy2UGyia4da8YZpMUPybsd22AM=
X-Google-Smtp-Source: AOwi7QBSK/w/wT4DHYfcdqohhDPClVwVxipmKMLU1EgKnMc0arF9aW8WxJvhPsLrubny/Gr10DTNS400bbuqgpxRtaM=
X-Received: by 10.46.71.193 with SMTP id u184mr9750243lja.166.1507092894399;
 Tue, 03 Oct 2017 21:54:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Tue, 3 Oct 2017 21:54:33 -0700 (PDT)
In-Reply-To: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
References: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Oct 2017 14:24:33 +0930
X-Google-Sender-Auth: MkvLBk59vKaT-wDN-a4A3rr_CMI
Message-ID: <CACPK8XfTqXHH53aN3+crxfEktrg_ipN8c23zT1gjcUmzBEmhtQ@mail.gmail.com>
Subject: Re: Call for maintainers
To: Chris Austen <austenc@us.ibm.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 04 Oct 2017 04:54:59 -0000

On Tue, Oct 3, 2017 at 11:22 AM, Chris Austen <austenc@us.ibm.com> wrote:
> The OpenBMC Project is looking for future maintainers. The amount of code
> now and expected in the near future will be more then any one person can
> continually handle. If you are a subject matter expert in a repo under
> https://github.com/openbmc or cross functional areas then taking on a role
> of maintainer might be appealing. This isn't a paid thing, this is
> completely voluntary opportunity (think Scouts without the camping or School
> volunteer without glue).
>
> So how might you go about getting this type of role on your resume? Start by
> signing up for code reviews
> https://gerrit.openbmc-project.xyz/#/q/status:open. Over the next few weeks
> we will be looking over the reviews for 1) understanding of the components
> architecture 2) Comments focusing on architecture that satisfies the needs
> of all 3) bugs 4) and more. Try to Focus on a single project.

I'd like to put forward two names of significant contributors:

For obmc-console, Jeremy Kerr. He's the author of a large amount of
the code and has helped out with a number of reivews through the 20
comments he's made.

For phsophor-mboxd, Andrew Jeffery. He's spent a lot of time reviewing
patches and helping guide the direction of the project. He's given 166
reviews, and made 207 comments.

I used https://github.com/wikimedia/analytics-gerrit-stats to generate
some of these stats. It could be used to identify other significant
contributors, even if it's simply confirming what we already know.

Cheers,

Joel
