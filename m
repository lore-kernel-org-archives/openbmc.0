Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyS635lNczDrd3
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 08:55:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="vmpN6ZKu"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yyS631zDmz9t39;
 Fri, 15 Dec 2017 08:55:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513288507; bh=speye6hvTGLWDf4HcW2GHC/ccC2O9U5HfPsU5x6wAes=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vmpN6ZKubefOkWQcyT/BheJKqKVuzF1c36KkdcKBK6S4b61TjV3VQTXeI4nAqOn7g
 vVrS7fJv/iKjYF9jws1ahSwqni/BGjTk/WLROCIaq2/Ov1phvLwQoPhJ5KDnGlR9Rb
 KTVhoquWI8hDRQ35oD5YQ9ahM1XAuU/VGNF6VqoKOdbFr27lh3RB/EdkkSdNhr7xzH
 RWZcK2rau1AnMutbgXAvMlcTkaROiEcIAVepmqOzjI72sPbdz7EH4d8A1vxGv0fgoh
 5TiXd/n+f2QJ3f7ytUHWqF4z+nXEQwguNVR4D9PphkrKO+vJQlwLlY4ZzS7hp6/XO2
 eZKvHSJDsUXMw==
Subject: Re: IPMI LAN command story design - try 3rd send
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
 <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
 <20171214162608.GK113334@mauery>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
Date: Fri, 15 Dec 2017 05:55:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171214162608.GK113334@mauery>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 14 Dec 2017 21:55:08 -0000

Hi Vernon,

> I would agree. ipmitool is broken. It should have a
> network-start-configure mechanism that would set the set-complete bit.
> The you could send any number of its network configuration parameters.
> Then it should have a network-finish-configure command that would clear
> the set-complete bit.

Or, even simpler: allow multiple parameter changes on one invocation:

 ipmitool [...] lan set 1 ipsrc static ipaddr 192.168.0.2 netmask 255.255.255.0

[which changes all parameters under one transition of the set-complete
flag]

Then, there's no need to modify existing users' behaviour, and no
concern about forgetting to apply.

Regards,


Jeremy
