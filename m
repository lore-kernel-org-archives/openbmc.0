Return-Path: <Luis.A.Silva@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=luis.a.silva@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="xZnZ6k+D"; 
 dkim-atps=neutral
X-Greylist: delayed 662 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jun 2018 23:10:37 AEST
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BMWd6QZczF0mR
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 23:10:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1529586638; x=1561122638;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=mAOjIXk3YP5qbbcrS2q3AyQ6q42HrNewNvEagpLTzGM=;
 b=xZnZ6k+DPctapJQCRWAkMH8HSdCOaLnoDB9CjtUAtoMCQY6DRKLeGR1F
 YlcPfcplyb1k0D6Wi6Bb11bTFJQKuSq0SagW7ClHeQEKcLQqN+7vwZ0jL
 Pmw20Oqz4jhqs7NDSvw2cFvjacvw6EBLRt2VV0T7BWavJMRh856qrsdEQ U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GsCAB6oCtbmGKa6ERbHAEBAQQBAQoBA?=
 =?us-ascii?q?YQrgTGDb5RCJoE1KpY+OwsjC4N4RgKCfCE4FAECAQEBAQEBAgEBAhABAQEBAQg?=
 =?us-ascii?q?LCwYpIwyCNQwMFwRLLDABAQEBAQEBAQEBAQEBAQEaAg1kAQUjZgsYAgImAgJHE?=
 =?us-ascii?q?AYNCAEBgyEBgX8PqXWCHIRbg2xoBQkBgQGHSYITgTaCOi6DGAICgiuCNIJVAod?=
 =?us-ascii?q?8hS6LfAcChX2JDQaBMQ6EAYgBih2BfoVFgViBdDMaI4M4EoIcg06KcI9jgRoBA?=
 =?us-ascii?q?Q?=
X-IPAS-Result: =?us-ascii?q?A2GsCAB6oCtbmGKa6ERbHAEBAQQBAQoBAYQrgTGDb5RCJoE?=
 =?us-ascii?q?1KpY+OwsjC4N4RgKCfCE4FAECAQEBAQEBAgEBAhABAQEBAQgLCwYpIwyCNQwMF?=
 =?us-ascii?q?wRLLDABAQEBAQEBAQEBAQEBAQEaAg1kAQUjZgsYAgImAgJHEAYNCAEBgyEBgX8?=
 =?us-ascii?q?PqXWCHIRbg2xoBQkBgQGHSYITgTaCOi6DGAICgiuCNIJVAod8hS6LfAcChX2JD?=
 =?us-ascii?q?QaBMQ6EAYgBih2BfoVFgViBdDMaI4M4EoIcg06KcI9jgRoBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 07:59:27 -0500
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 18:59:27 +0600
X-LoopCount0: from 10.166.136.216
X-IronPort-AV: E=Sophos;i="5.51,251,1526360400"; d="scan'208";a="1174174188"
X-DLP: DLP_GlobalPCIDSS
Subject: Re: Unable to use ipmitool in OpenBMC Linux
To: <openbmc@lists.ozlabs.org>
References: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
From: Luis Silva <luis.a.silva@dell.com>
Message-ID: <67c4aeb8-9a4f-2b7f-880d-94ec6a9a8aff@dell.com>
Date: Thu, 21 Jun 2018 07:59:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.30.186.183]
X-ClientProxiedBy: ausx13mps340.AMER.DELL.COM (10.166.136.217) To
 ausx13mps339.AMER.DELL.COM (10.166.136.216)
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
X-List-Received-Date: Thu, 21 Jun 2018 13:10:40 -0000

On 6/21/2018 5:20 AM, AKASH G J wrote:
> Hi Team,
> 
> 
>       <https://github.com/openbmc/openbmc/issues/3267#issue-334338630>
> 
> I added ipmitool into the root file system of OpenBMC Linux and booted
> it. When I tried to execute ipmi tool(inside OpenBMC Linux), it is
> showing the following error.
> 
> root@zaius:# ipmitool sdr elist full
> *Could not open device at /dev/ipmi0 or /dev/ipmi/0 or /dev/ipmidev/0.
> No such file or directory.*
> 
> Please someone help to resolve this.
> 

Hi Akash, try this:

ipmitool -I dbus sdr elist full

Silva.
