Return-Path: <richard.purdie@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=richard.purdie@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.b="Knar14h3"; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KWhr0nsPzDqt3
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 21:43:51 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id c126so5865674wmh.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ir31SjGTEI4n34T3LBevgn7zXFu9sdBeW22PbqUhf0s=;
 b=Knar14h30SbFSYAwQTauhDYZD/Z49nmw2rv0R8NDzl4fiJP8I3M0bJudE4iNpfSv8r
 6Z7O4BxX4wz4sWj9K+OYfVuPCE4ipTvi9AuAp/TqdvHBqi795ETtB/t5HEwntc0VgTrk
 yNmT8pMToYroIdvW47OYubW1zgmdPyunAaVDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ir31SjGTEI4n34T3LBevgn7zXFu9sdBeW22PbqUhf0s=;
 b=NUYwLvdG6fckFtk/UXzpCNGVadv2o2PHN8dHB4y3E6rcqDmbNqpJA3XB6T8M5W/58V
 XLBZXLqxeD3vxQuODtQtSVPGHqPVgfqkbh7HxHk8h8qKsSiUoYkHHMMMYzTpVXVZx59N
 vdwTxiu546jUPAiQkSZ8SgH4O4iTLSfkTkivzm+oHkpJG9j89UG012irRTSy8YDqV9pn
 BRL4tWyXvTqeXvZBnQ9ytzluOzJ9GhmaTAFNd0HeZBHUF1Kl/6uTfVdCVKhr+JNGNdDm
 SjWp0aFMcJqmIy+GH4fRdwoSnJhzZ10l/bQ0CmWctyChNJaTIc7dCht7aJUFgWqvuM0o
 h3iw==
X-Gm-Message-State: AA+aEWYWCk9HCVI3oMAy6w5glsoezPfGb2Jlf0CA2us3Dkc8LVTYbFXT
 9auLTJLnlAK3C8Oo3UhbF9va6g==
X-Google-Smtp-Source: AFSGD/W1/d9KsT8MN4/3efW9TIdTLqn0xn85bgmGB6wDM2leNOjKQmqg4X9iZInLgTjryV2ccgY5kg==
X-Received: by 2002:a1c:8c05:: with SMTP id o5mr6283778wmd.29.1545216228507;
 Wed, 19 Dec 2018 02:43:48 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
 by smtp.gmail.com with ESMTPSA id w125sm5006025wmb.45.2018.12.19.02.43.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 02:43:47 -0800 (PST)
Message-ID: <62200bb7528e2f863ca074790a7407fc7c73630d.camel@linuxfoundation.org>
Subject: Re: [OE-core] flto automake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Bradley Bishop
 <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, james.feist@linux.intel.com, OE-core
 <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2018 10:43:46 +0000
In-Reply-To: <CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAJTo0LY=EtEJpniVngfbkxbg3ibnEY9qvR18kOSpjFejh_tomA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 02 Jan 2019 10:25:34 +1100
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
X-List-Received-Date: Wed, 19 Dec 2018 10:43:57 -0000

On Wed, 2018-12-19 at 10:00 +0000, Burton, Ross wrote:
> On Wed, 19 Dec 2018 at 01:07, Burton, Ross <ross.burton@intel.com>
> wrote:
> 
> > That however leads to the question of should we just change the
> > defaults? Does anything break if we use gcc-ar instead of ar?
> 
> Answer: yes.
> 
> > x86_64-poky-linux-gcc-ar  rc libgcov.a $objects
> > x86_64-poky-linux-gcc-ar: Cannot find plugin 'liblto_plugin.so'
> > Makefile:932: recipe for target 'libgcov.a' failed
> ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/gcc/libgcc-
> initial_8.2.bb:do_compile)
> failed with exit code '1'
> 
> I don't know enough about gcc...

The -initial compiler doesn't have lto compiled into it so you probably
need to use binutils ar for that part of the bootstrap.

Cheers,

Richard
