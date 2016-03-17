Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x231.google.com (mail-ob0-x231.google.com
 [IPv6:2607:f8b0:4003:c01::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQXnL698LzDqHw
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 13:47:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=x7UD6Rdt; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Rjl9lQ4u; 
 dkim-atps=neutral
Received: by mail-ob0-x231.google.com with SMTP id m7so70414342obh.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 19:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nSZmUtSVpGyNN/70ayffofMEIv0bEAUrLWEfY1Mlfao=;
 b=x7UD6RdtrBt0DEXmWW32ahAvuVUameyrCRzNEcT9fLTT3R1RRLiHzp4xcuMfrv4H3K
 FkNggCRwi/0oySHzo6+SI/nLdoe5Y1ZLZ0AVdFPgzbEet2emDv1ztQ5fqD3di/9JJwzX
 vz33PX7uHyKsocNGJ3B/scChMPb0MG7MrYGEj0pZ/cMcT7ZjVsX/ZXg8BAQXaPhZN9jz
 09y5zj7kOqJJ9Dn4MkuWVmZN7vsQA15ebSwYfnXcBHD/aiQ6qNUok/IDmLrtrMwraMMW
 Qxo6MqBGlj+QfBZGbMVPmsOdZYQtUTv7j4KPEK0l7Im9XHKp32NXeF1F3m8xGilxgRoG
 gW0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nSZmUtSVpGyNN/70ayffofMEIv0bEAUrLWEfY1Mlfao=;
 b=Rjl9lQ4ujGmoAmltgsranjhqmVldgGswWfIZXXd6xzPfHj8aCEhVTgVlnwOBZywrTy
 cbbQe3qJAjzetanDikq24ZDzOej/TDQg42s1SGhGn81Ci9YwQmsZXQO+91EmD35FyNj9
 j7VQqbQW7Vh6Q9ofnP+mKtQq1EuDZLK5dCV9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nSZmUtSVpGyNN/70ayffofMEIv0bEAUrLWEfY1Mlfao=;
 b=SsIZsIZRz1T0Zahr5/IV9yqDfAGvb/8cuGoqZRgRuyEbb4AWGqOuFl09rTbpL98Sj1
 fUQNGyWafGVhb13Oiyfmremu9+DJvisBSTzI2sa7pHVX8PtMLd2JviQ3mfeetCWzQ7pL
 HsFIpfrfCx6F7MEopl8JYK6JUAJEnFa0b7Ox0U+GYWpfHYOYRR9c798h1sqIB565Xbuc
 w97sB13EB09Lr70KfnpzBcUsWZDBknJ3Fl6jyUZd/Q0AXUysXJNcDA9JvWxvF4SwModQ
 wF0SUsL1mC1ARbTP4LQ3hJs+NYum+kqe7WadFYkFjzbM1XuCIE2kzne0zA0rFcMkZFrX
 TLFA==
X-Gm-Message-State: AD7BkJJxLmMr5xDfeNA5EsBSb0kvdDs3Yntv87s7C8Ivy6zu2+HrBMAL+at/fj2khoukAcxV0wzgZ8W3PfWaFw==
X-Received: by 10.60.84.98 with SMTP id x2mr4861223oey.23.1458182820557; Wed,
 16 Mar 2016 19:47:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 16 Mar 2016 19:46:41 -0700 (PDT)
In-Reply-To: <201603162204.u2GM4ONm008317@d03av01.boulder.ibm.com>
References: <201603162204.u2GM4ONm008317@d03av01.boulder.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Mar 2016 13:16:41 +1030
X-Google-Sender-Auth: gV0k2brRBkXsVi0bqn4qLjIVDUM
Message-ID: <CACPK8XcHYMomV7i6Mg9haWpL10ugde7ajmaa_MkePL4c63YnHQ@mail.gmail.com>
Subject: Re: Upstream jffs2 patches
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 02:47:05 -0000

Hello Milton,

On Thu, Mar 17, 2016 at 8:34 AM, Milton Miller II <miltonm@us.ibm.com> wrote:
> We have definitive evidence of the problem fixed by
> be629 causing the application stack not to run because
> the directory went missing.  The next 2 are a deadlock
> reported as widely encountered and affecting garbage
> collection which is required for writes.

Okay. As we discussed a few weeks ago, we will move to a 4.4 based
tree after the past release was tagged. This has the upside that most
of the fixes you mention below are in the tree already.

I will send a PR to move us to 4.4.

> be629c62a603e5935f8177fd8a19e014100a259e
>    Fix directory hardlinks from deleted directories

This is 3ef98fdea9a9bb8d0ba653faadcf16525d6e0f9c in our 4.4 based tree.

> 157078f64b8a9cd7011b6b900b2f2498df850748
>    Revert "jffs2: Fix lock acquisition order bug in jffs2_write_begin"

This is 17f9501631948e130b81aa7ff7a0bd8ef107e07c in our 4.4 based tree.

>
> 49e91e7079febe59a20ca885a87dd1c54240d0f1 j
>    ffs2: Fix page lock / f->sem deadlock

This is 17d919c7379efbe5489243cd7ffa8a24fe09470b in our 4.4 based tree.

> In addition consider these:
>
> f93812846f31381d35c04c6c577d724254355e7f
>    jffs2: reduce the breakage on recovery from halfway failed rename()

This is in 4.4.6 which I haven't merged in, but I'll do so before
sending the PR.

>
> eb042ec35956de2684de2a05a814cd15efe570ca
>    jffs2: fix a memleak in read_direntry()

This was part of 4.3, so we have always had this patch.

Cheers,

Joel
