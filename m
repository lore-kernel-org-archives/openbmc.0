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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kWKs5pgCzDqL2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 01:40:16 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 22 Jan 2019 09:40:40 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Cc: openbmc@lists.ozlabs.org, ed.tanous@intel.com
Subject: Re: Need help to create a new repo for MDR
Message-ID: <20190122144040.ihrqiwg5xmjmo6j5@thinkpad>
References: <7c7d2165-d53d-6a33-0fec-069fdfbbbeda@linux.intel.com>
 <20190115171928.ilyfajso343ha2xh@thinkpad>
 <8fcfba7b-3da7-eb35-6434-40bc9130f3b3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fcfba7b-3da7-eb35-6434-40bc9130f3b3@linux.intel.com>
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
X-List-Received-Date: Tue, 22 Jan 2019 14:40:18 -0000

On Wed, Jan 16, 2019 at 04:12:21PM +0800, Yang, Cheng C wrote:
> How about "managedDataRegion" or "smbios-mdr" ?

smbios-mdr created.

> 
> Thank you very much!
> 
> On 1/16/2019 1:19 AM, Brad Bishop wrote:
> > On Wed, Jan 09, 2019 at 11:50:01AM +0800, Yang, Cheng C wrote:
> > > Hi Brad,
> > > 
> > >      Intel platform has a feature called MDR which used for BIOS transfer SMBIOS table to BMC.
> > > 
> > > There are two version in MDR, MDR V1 and V2.
> > > 
> > > MDR V1 is based on ipmi commands, BIOS will send SMBIOS table in pieces through ipmi  oem commands.
> > > 
> > > MDR V2 use VGA shared memory, BIOS will send whole SMBIOS table to VGA shared memory in ast2500 before post complete, and then BMC can get the SMBIOS table from VGA shared memory.
> > > 
> > > During the post phase,  our BIOS will first try to send SMBIOS table through MDR V2, and if not succeed, BIOS will try to send MDR V1 then.
> > > 
> > > After BMC get SMBIOS table, BMC will put CPU and DIMM information to dbus interface and then Web page can show these CPU DIMM information  to users.
> > > 
> > > I have implemented the MDR feature and hope to upstream it, so do you mind help to create a repo for MDR feature?
> > > 
> > > Thank you very much!
> > Hi Cheng
> > 
> > What would you like the MDR repository to be called?
> > 
> > thx - brad
