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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QRBw5Yy0zDrdZ
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 02:39:03 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Fri, 14 Jun 2019 12:39:49 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: meta-yadro subtree
Message-ID: <20190614163948.ziy62zrcpif65zpu@thinkpad>
References: <20190603115332.GA20703@bbwork.lan>
 <0b087d91bf683a9d2e28ccdf751147e26c45a277.camel@fuzziesquirrel.com>
 <20190614144256.GA13210@bbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190614144256.GA13210@bbwork.lan>
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
X-List-Received-Date: Fri, 14 Jun 2019 16:39:05 -0000

>>
>> Hi Alexander
>>
>> I finally did this today.  Thanks!
>>
>> -brad
>
>Hi Brad
>
>What about corresponded subtree in the openbmc/openbmc repository?

oops.  please check: https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/22626
