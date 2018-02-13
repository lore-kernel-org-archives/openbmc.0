Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="JZG7dRHE"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgSHf0P5MzF0vR
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 14:11:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518491502; x=1550027502;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hrmSgJEW4sNN2amFK4QhI7TMzy6s/T0WxRVLW055AJg=;
 b=JZG7dRHEMJ3USTnBpmHdzrrtln77iWPblWXxtiz8W7febiFZNBKLSq+d
 FfPCKeoTCCw2ydVKbQEXN5RecgKzxJedd/JD0jQfv3dIMg0FbdtIAXqWm
 EAup6+Mv1tPI74lDo1jSy6jfZcohU69CZ5XZEDej6o0XEg+N7hmb/Z6Zf 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F3AAB1VoJamD+a6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQoEHAojgmOJ4ICgReOSYd4FYFAQwoYC4ELhA0Cgk1UGAECAQE?=
 =?us-ascii?q?BAQEBAgECEAEBAQEBCAsLBigvgjgkAQoESyouAQEBAQEBAQEBAQEBAQEBARoCD?=
 =?us-ascii?q?SI7AQEBBAE5PxALFQMJExIPBRQ1E4o1ELEHiH+CEQEBAQEBBQEBAQEBI4R8ghW?=
 =?us-ascii?q?GbYMvAgKBPAESAYNngjQFkk2BFpBLCQqIFodDhhSJV4p6jgKGFwGDfoE8H4Eac?=
 =?us-ascii?q?E0jgxgJglyCMVkBAYl+gjwBAQE?=
X-IPAS-Result: =?us-ascii?q?A2F3AAB1VoJamD+a6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?oEHAojgmOJ4ICgReOSYd4FYFAQwoYC4ELhA0Cgk1UGAECAQEBAQEBAgECEAEBA?=
 =?us-ascii?q?QEBCAsLBigvgjgkAQoESyouAQEBAQEBAQEBAQEBAQEBARoCDSI7AQEBBAE5PxA?=
 =?us-ascii?q?LFQMJExIPBRQ1E4o1ELEHiH+CEQEBAQEBBQEBAQEBI4R8ghWGbYMvAgKBPAESA?=
 =?us-ascii?q?YNngjQFkk2BFpBLCQqIFodDhhSJV4p6jgKGFwGDfoE8H4EacE0jgxgJglyCMVk?=
 =?us-ascii?q?BAYl+gjwBAQE?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2018 21:11:38 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2018 09:07:24 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,505,1511848800"; d="scan'208";a="131566098"
X-DLP: DLP_GlobalPCIDSS
Date: Mon, 12 Feb 2018 21:11:37 -0600
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>
Cc: Rolf Brudeseth <code@brudeseth.name>, openbmc@lists.ozlabs.org
Subject: Re: Redfish on OpenBMC
Message-ID: <20180213031136.GB9498@wn7x64-4cggry1.aus.amer.dell.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169932F662C08@ORSMSX114.amr.corp.intel.com>
 <OF31121584.33F1DD5E-ON6525822B.0055E9F8-6525822B.005D34B2@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169932F66373A@ORSMSX114.amr.corp.intel.com>
 <3df976c0-67f9-3444-4191-6e56598e4713@brudeseth.name>
 <OFFEC95981.9C8EC008-ON6525822E.001E809D-6525822E.00203659@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFFEC95981.9C8EC008-ON6525822E.001E809D-6525822E.00203659@notes.na.collabserv.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 03:11:43 -0000

On Thu, Feb 08, 2018 at 11:21:50AM +0530, Hariharasubramanian Ramasubramanian wrote:
>  "openbmc" <openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org> wrote
>  > From: Rolf Brudeseth <code@brudeseth.name>
>  > Golang? It has webserver and template functionality built-in so an
>  > additional framework may not be required.
>  >
>  > It is compiled so it should have better performance than Python.
>  > Cross-compiling to ARM is trivial.
>  >
>  > Rolf
>  There certainly is no precedence for golang based code in OpenBMC yet.
>  But that shouldn't stop us from exploring that. I believe Michael's
>  implementation is golang based as well.

Indeed. My implementation is at https://github.com/superchalupa/go-redfish/

It is in golang and it is trivial to cross compile for ARM. Build instructions
are now in the README.

Additionally, as detailed in my previous email, if you have cross openssl
library available, you can compile against that purely for additional speed.
(2x as fast!) There is a helper script scripts/build-arm.sh that I made for
that.

After a few weeks of work, I think that I'm finally ready for additional people
to help. With most projects, there is a minimum level of functionality that has
to be in place before you can start bringing other people on, and I finally
feel like I'm at that point.

--
Michael
