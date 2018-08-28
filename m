Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420DQw4ZBczDrJ5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 02:16:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 09:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,300,1531810800"; d="scan'208";a="258756390"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.91.225])
 ([10.252.91.225])
 by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2018 09:16:36 -0700
Subject: Re: Enabling LDAP for Dropbear
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <dd28c1e6-bb95-178f-09e2-dbc8ab516773@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <a461620b-a7fe-c3ec-5f5b-d06ce45875c3@linux.intel.com>
Date: Tue, 28 Aug 2018 21:46:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <dd28c1e6-bb95-178f-09e2-dbc8ab516773@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 16:16:41 -0000

Ratan, which pam config file you tried. It should be done in 
/etc/pam.d/login (Not tried this, but can give  a try)

The problem with pam_mkhomedir.so is the home directory will not be 
deleted after logout, and may end up with stale home directories (Need 
to figure out a way for this?).

Not aware about this  Autofs, need to understand about this, before 
making any comment.

regards,
Richard


On 8/28/2018 3:23 PM, Ratan Gupta wrote:
> Hi All,
>
> As part of enable LDAP on the BMC,We are enabling the LDAP on the 
> dropbear(ssh server) through pam configuration,I am facing a problem 
> when the ssh client trying to connect the bmc through ssh.
>
> There are two steps involved when ssh client connect to the ssh server.
> 1) Authentication
> 2) Open the shell
>
> I could have seen that authentication gets success but opening the 
> shell got failed since the home directory should be existing for the 
> ldap user.
>
> To solve this I tried to make the following changes in the pam config 
> file.
>
> session required /lib/security/pam_mkhomedir.so skel=/etc/skel/ 
> umask=0077 debug >>> pam_mkhomedir should have been created the 
> directory.
> session sufficient      pam_unix.so debug
> session sufficient /lib/security/pam_ldap.so debug
>
> Even after making the above changes I don't see that the home 
> directory was created.
>
> NOTE:- If I create the directory in advance then I am not facing this 
> problem.
>
> We have other option to solve this is to mount directories over 
> network with the use of autofs service
>
> https://help.ubuntu.com/community/AutofsLDAP
>
> Can some body help me what could be other option to create the home 
> directories and which one is used industry wise?
>
> Ratan
>
