Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rd9N5mldzDqVd
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 03:25:27 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: corosync?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAH1kD+Yw2AcigiDcxpUfHB_M7C3u2s8RdqG3dbyHwuJXyS0gng@mail.gmail.com>
Date: Mon, 30 Mar 2020 12:25:23 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <40E87090-8313-420D-9E0F-AC6CA36EF665@fuzziesquirrel.com>
References: <AA561FEC-E514-41F1-800F-B1085C05D6C2@fuzziesquirrel.com>
 <20200324160659.GB23988@patrickw3-mbp>
 <318AF56E-3DC0-4B3E-9B41-E49C51A1F3B3@fuzziesquirrel.com>
 <CAH1kD+Yw2AcigiDcxpUfHB_M7C3u2s8RdqG3dbyHwuJXyS0gng@mail.gmail.com>
To: Richard Hanley <rhanley@google.com>
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
X-List-Received-Date: Mon, 30 Mar 2020 16:25:29 -0000

at 8:37 PM, Richard Hanley <rhanley@google.com> wrote:

> We looked into getting Envoy as a proxy for a distributed BMC network.   
> The idea was that Envoy could be used for discoverability and creating  
> long lived authenticated channels with HTTP/2.  That work got mostly  
> shelved because it was really hard to get the build system to work on  
> 32-bit arm (not to mention getting it to work with bitbake).
>
> I'm not too familiar with corosync.  I remember reading a bit about it  
> when Vishwa mentioned aggregating BMCs a few months ago.  It looks like  
> it should be relatively easy to build (at least compared to envoy).
>
> Unfortunately we never got a chance to see how much cpu usage is used  
> when Envoy is run on a Poleg.  In terms of sheer craziness, corosync  
> isn't any less crazy than what we were thinking about, and I was  
> relatively optimistic that it could work on current generation hardware.
>
> - Richard

Thanks for the reply Richard!

-brad
