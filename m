Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qzT70l0MzDqw3
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2019 04:06:01 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3C0976DEB3;
 Fri, 19 Jul 2019 14:05:57 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: moving phosphor-host-ipmid: entity config to json
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=noty6SfCsuodRN7rZ1KA1L=MtJkAq7DibZVt=n05kXrQ_QQ@mail.gmail.com>
Date: Fri, 19 Jul 2019 14:05:56 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, Tom Joseph <tomjoseph@in.ibm.com>,
 Ofer Yehielli <ofery@google.com>
Content-Transfer-Encoding: 7bit
Message-Id: <BB9353D1-4478-4FD1-B502-23112E55BC7F@fuzziesquirrel.com>
References: <CAO=noty6SfCsuodRN7rZ1KA1L=MtJkAq7DibZVt=n05kXrQ_QQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
X-List-Received-Date: Fri, 19 Jul 2019 18:06:03 -0000

at 12:54 PM, Patrick Venture <venture@google.com> wrote:

> Currently the entity-configuration is in yaml and compiled in.  We're
> the only ones using this downstream, as far as I can tell.  I'd like
> to move it to json and make it part of the phosphor-ipmi-config
> bucket.
>
> This entity config:
> https://github.com/openbmc/meta-phosphor/blob/master/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb#L106
>
> Used:
> https://github.com/openbmc/phosphor-host-ipmid/blob/f442e119aed2dc87f320bf230ad39e7dc5c72524/sensorhandler.cpp#L29
>
> The format will be similar.
>
> Any objections?

That sounds great to me, thanks!
