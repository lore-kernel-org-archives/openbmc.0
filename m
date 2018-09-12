Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429Pyf0ldBzF36T
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 00:57:28 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1DD206DBA3;
 Wed, 12 Sep 2018 10:57:25 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: phosphor-ipmi-blobs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxmEwWc1Ti4LFj963E-Su2Sy8Hp6NFOaYM1w2k0mf+jOA@mail.gmail.com>
Date: Wed, 12 Sep 2018 10:57:24 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <31306F60-60D3-49E3-AD31-1A3A2F6FD190@fuzziesquirrel.com>
References: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
 <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
 <CAO=notzcJFGD6fJn_LpKQgHUkyU_whW-2CiTe26kcq-+G3T7Ww@mail.gmail.com>
 <CAO=notxmEwWc1Ti4LFj963E-Su2Sy8Hp6NFOaYM1w2k0mf+jOA@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Wed, 12 Sep 2018 14:57:30 -0000

> On Sep 12, 2018, at 10:17 AM, Patrick Venture <venture@google.com> wrote:
> 
> Brad, if you create a phosphor-ipmi-blobs repository and set myself
> and Kun Yi (kunyi731@gmail.com) as maintainers via the system (I can
> create the maintainers file).  I will submit the code in one patch.  I
> can put it up for review first to gather feedback -- since we haven't
> fully integrated it into things, this is a great time.

done!
