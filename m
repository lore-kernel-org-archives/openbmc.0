Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yd7Bx288VzDqwG
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 04:14:16 +1100 (AEDT)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Nov 2017 09:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; d="scan'208";a="150185114"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2017 09:14:12 -0800
Date: Thu, 16 Nov 2017 09:14:12 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: HPM firmware update
Message-ID: <20171116171412.GD113334@mauery>
References: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
 <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2017 17:14:18 -0000

On 16-Nov-2017 11:14 AM, Jeremy Kerr wrote:
>Hi James,
>
>> I=E2=80=99ve started looking at using the PICMG HPM specification that w=
as
>> recommended as the preferred API for performing firmware updates. This
>> is not an open specification, and goes against the principles of the
>> openbmc project.
>
>Yes, that's very true. My previous experience is on the client-side of
>HPM, which is implemented in ipmitool already.
>
>> The HPM specification must also be purchased from the PICMG standards
>> organization, and contains patent liabilities. I think using HPM is a
>> non-starter.
>
>We could always request DMTF to make it more widely available. However,
>unless that does change, I'd agree with you that we'd want to avoid
>HPM.1.

We don't have to go with HPM though. Our prior version of BMC used a=20
fairly straight-forward model that is not too different than the HPM=20
model, though it was developed in-house. It is pretty generic and could=20
be used to transfer any payload over a variety of transports.

If we can define our own 'standard' for OpenBMC firmware update methods,=20
then we can implement that in ipmitool (like the dell oem commands or=20
something).

An overview goes something like this:

1) enter FW transfer mode
2) optionally send parameters (no-rollback, deferred reboot, debug, etc.)
3) <make a choice for either IPMI streaming or other transport>
	a) for streaming
		i) write data blocks as IPMI FW command
	b) for usb mass storage
		i) send plug-in IPMI command
		ii) host-side mount usb mass storage device, writes fw image
		iii) send plug-out IPMI command
		iv) send 'set uri command' (usb://...)
	c) for network transport
	    i) send 'set uri command' (http(s)://..., tftp://..., ftp://...)
4) send transfer complete IPMI command
5) check status
	status moves from download -> verify -> program -> ready
	status can move to error from any state
6) once status moves to ready, firmware update is finished, ready to=20
	reboot.
7) send exit fw transfer mode IPMI command. This causes the BMC to=20
	reboot unless a deferred reboot has been selected.


This mostly describes what the IPMI control does, which is pretty=20
generic. The trickiest bit is offering multiple mechanisms for transport=20
because IPMI is not the most efficient method to transport (unless you=20
use 64kB payloads during the streaming phase. Even then, the TCP=20
protocols are faster because of round-trip timing (only need an ack=20
rather than a full trip through the IPMI command lookup and execution=20
process.) USB is pretty fast, but not available for every system.

--Vernon
