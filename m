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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLZt9123DzDqWk
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 23:12:28 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <bc912bd8fef6a69b43c08761128f32c7aee3c24b.camel@fuzziesquirrel.com>
Subject: Re: Phosphor virtual sensor
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Tue, 04 Aug 2020 09:10:25 -0400
In-Reply-To: <85F50CF8-34D6-4DA4-9090-9FAE6AE07605@fb.com>
References: <DF74EA96-65CA-430F-9525-56DF39237550@fb.com>
 <85F50CF8-34D6-4DA4-9090-9FAE6AE07605@fb.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 04 Aug 2020 13:12:34 -0000

On Fri, 2020-07-17 at 20:04 +0000, Vijay Khemka wrote:
> Hi Brad,
> Please create a following repo, I will start coding.
> 
> Regards
> -Vijay

Sorry Vijay.  I finally created this today.

-brad
