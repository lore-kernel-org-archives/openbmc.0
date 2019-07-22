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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45snzZ5H9WzDqV2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 03:05:14 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 22 Jul 2019 13:06:00 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Timothy Pearson <tpearson@raptorcs.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Request for meta-rcs subrepository
Message-ID: <20190722170600.hmlxdhfg67lhrj6v@thinkpad>
References: <2086908422.1402251.1563809088306.JavaMail.zimbra@raptorcs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2086908422.1402251.1563809088306.JavaMail.zimbra@raptorcs.com>
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
X-List-Received-Date: Mon, 22 Jul 2019 17:05:15 -0000

On Mon, Jul 22, 2019 at 10:24:48AM -0500, Timothy Pearson wrote:
>Per the discussion on 
>https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/23547, I would 
>like to request creation of a meta-rcs repository to hold 
>product-specific layer data for our product lineup.
>
>Thank you!

Created meta-rcs.  Thanks!
