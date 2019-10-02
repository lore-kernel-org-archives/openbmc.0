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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jwWg0GS1zDqRH
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 22:32:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 0F75C14881;
 Wed,  2 Oct 2019 08:32:26 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [Potential Spoof] i2c-dev wrapper
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <686CD1F4-2558-48BB-B364-E44C482143CA@fb.com>
Date: Wed, 2 Oct 2019 08:32:25 -0400
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "shawnmm@linux.ibm.com" <shawnmm@linux.ibm.com>
Content-Transfer-Encoding: 7bit
Message-Id: <D28596A5-7E95-4F86-860B-4325194BD0C9@fuzziesquirrel.com>
References: <686CD1F4-2558-48BB-B364-E44C482143CA@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>
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
X-List-Received-Date: Wed, 02 Oct 2019 12:32:31 -0000

at 5:36 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:

> Brad, We are using them in entity manager  
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp

thanks for the pointer Vijay.
