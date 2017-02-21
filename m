Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZCh3mqmzDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:59:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170221214916.365zogt3siz2ybi2@asimov>
Date: Tue, 21 Feb 2017 16:59:23 -0500
Cc: Alistair Popple <alistair@popple.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Message-Id: <653FA956-68B2-41B4-8233-4A31C57E1E67@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
 <2536438.YnoCRmC1BK@new-mexico> <20170221214916.365zogt3siz2ybi2@asimov>
To: Patrick Williams <patrick@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2017 21:59:28 -0000


> On Feb 21, 2017, at 4:49 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
> 
> On Tue, Feb 21, 2017 at 02:34:18AM +1100, Alistair Popple wrote:
>> I would also be interested in the answer to the inverse - why put them
>> in the kernel? There's the OCC hwmon driver - what chip-ops does that
>> need? Just get/putscom? If that's the case I thought we were already
>> exposing scom chip-op operations via an OpenFSI master?
> 
> When the P9 chip has security enabled, you cannot even issue SCOM
> operations without going through the SBE FIFO.  The SBE provides a
> white-list filtering system that prevents the majority of the SCOM space
> from being accessed.  We will need a "SCOM over FIFO" driver on top of
> FSI.

Well, we need a way to do scoms over sbe.  Not sure that equals being
a device driver.  As it stands if it were a driver, it would just be
very thin wrapper around the sbefifo driver.

> 
> -- 
> Patrick Williams
