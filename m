Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::231; helo=mail-oi0-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OgeIQy+P"; 
 dkim-atps=neutral
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FDs91tvgzF3JR
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 06:21:00 +1000 (AEST)
Received: by mail-oi0-x231.google.com with SMTP id l202-v6so3023091oig.7
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 13:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uPu02nSI0MXRjtgrRDoF87MMbptZcUW6jp0aQQVeyMs=;
 b=OgeIQy+PpVDHfcA3ERjB9NxZkcOJ1gX3JP9l03SqFoBi5OGs39iiDwEmZoCYkxT5DF
 qWtJKffJcy5tEgWZNM3m4dZY4UdV0mbS3yqe020y9eQcBI91qJA+KrQ7huWy6LLc3Kh3
 4O6VYbubwdGY2fXv8HY6uYQnE+9INnnn675wwRgQGKa7IuzgZRDBmaEg+6yIT8LAvtsm
 lC7K9kSRuO6cCk1yZLAtOK5Aa6f+DKrzIUxDtTiDBgfVQo/fUZBytW4Kyk16O/Lk69k5
 PG12fcdakhUanBanl0ZkSuB1SoxWpLRJuqn1S93mXOfTBFslfWvCddUF7CtCG6nOOpKk
 SXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uPu02nSI0MXRjtgrRDoF87MMbptZcUW6jp0aQQVeyMs=;
 b=D7sK2OqeR+0zEEwtTieWj2yll3Lhlh3Avmy8KOXTq+N5FQboNvKGqIK4wCulFRg3/J
 WNmOlCH/RcFEIvoyYe98y2vi09GlPnWrNA7vluvBWCm6fh4MV6R9aAeGcE83PPBF7lFr
 ybGAnOyk24Ffbz9gLXZtCYGYJqUwcE9M3hsaksI8/mmr5MGQylewzCOCJuMv87AKLcrT
 j63m7gHe/EkfxOHw9RpX82Pyn9oKPqgfuZJAZpjWTBDzS3p/6ZHJxKVHrEa4Oxl8ejo/
 xs1mm7pcu6dS84dI3To0YuP6A/d1BH/ZYjjNzzuGAbO1qkkfpLWSucwxYuTLinQ/2d7J
 0rbw==
X-Gm-Message-State: APzg51CPav9CwWbtzCGFffF+FWsD/h6yx5E7ZjLDgKrfhV2ZNfo+3ODh
 FykkTH3wpvhbX8H1VdrjHSxW+qoYFw5XnetMZMc=
X-Google-Smtp-Source: ANB0VdYBSP3zEoW39CMBC5UeZ/GZt48zpy0AiQQhAUGY8yfEwVjewUeWapPEoBnQek+40mTKkLIQ9pMJrH6MSfS3xd8=
X-Received: by 2002:aca:90d:: with SMTP id 13-v6mr2724466oij.300.1537302058180; 
 Tue, 18 Sep 2018 13:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
In-Reply-To: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 18 Sep 2018 15:20:47 -0500
Message-ID: <CALLMt=p+dH3e-C2M8L9Zv43vTDw9rcd9MpfcqFXge2aTkzk6Hw@mail.gmail.com>
Subject: Re: OpenBMC Hackathon @ OpenPower Summit?
To: sdasari@fb.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>, 
 Joel Stanley <joel.stan@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 18 Sep 2018 20:21:02 -0000

On Tue, Sep 18, 2018 at 2:56 PM Sai Dasari <sdasari@fb.com> wrote:
>
> https://openpowerfoundation.org/summit-2018-10-eu/
> Team,
> Saw above agenda mentioning =E2=80=9COpenBMC Hackathon=E2=80=9D and wonde=
ring any further details on who from this team is planning to attend.

Hey Sai, looks like Stewart, Joel, Jeremy, and myself will all be attending=
.

We're just building the agenda now but we were thinking some basic
overviews, then some kernel hacking, SDK/QEMU hacking (systemd,
journald, service intros), and some customization hacking (adding new
machine layer, customizing web UI for your system).  Any other
thoughts/ideas from the group appreciated.  The overall goal is to
teach people unfamiliar with openbmc how to dive in and start hacking
at it. The OpenBMC community hackathon will be at the Intel summit
middle of next month up in Oregon.

Andrew

> Thanks,
>
> Sai.
