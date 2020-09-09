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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmk4P405fzDqWP
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 23:53:07 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 9 Sep 2020 09:53:02 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Cisneros, Jorge (George)" <jorge.cisneros@hpe.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: FW: Request to add meta-hpe as subtree
Message-ID: <20200909135302.cnenc5joeyjdbkww@thinkpad.dyn.fuzziesquirrel.com>
References: <CS1PR8401MB0566CA9B0A0D168049F6D0E58F510@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB0566C7D5CDBC13FE4CFAEED68F290@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CS1PR8401MB0566C7D5CDBC13FE4CFAEED68F290@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
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
X-List-Received-Date: Wed, 09 Sep 2020 13:53:10 -0000

On Tue, Sep 08, 2020 at 02:32:37PM +0000, Cisneros, Jorge (George) wrote:
>A kindly reminder, please help to add meta-hpe into openbmc as subtree,
>thanks!

Hi Jorge

I finally got to this today:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/36339

-brad
