Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445dcC1gsSzDqVJ
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 04:28:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 09:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,400,1544515200"; d="scan'208";a="146492165"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2019 09:28:56 -0800
Subject: Re: TLS cipher suite changes on master
To: openbmc@lists.ozlabs.org
References: <7E9441B1E5EFFD4681F54958E8216993459B6F13@ORSMSX114.amr.corp.intel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <41fdcaee-751a-6880-8e40-a008606a7e22@intel.com>
Date: Fri, 22 Feb 2019 09:28:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993459B6F13@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 22 Feb 2019 17:29:00 -0000

FYI, This change was attempted again this morning.  Be on the lookout.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/18083

-Ed

On 1/18/19 3:51 PM, Tanous, Ed wrote:
> I’d like to draw people’s attention to a patchset for bmcweb here:
> 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/17390/
> 
>  
> 
> This is updating the bmcweb cipher suites to more secure values, and in
> turn deprecating support for some older framework that we might have as
> clients.  As stated in the patch, we are following OWASP “B” cipher
> suite recommendations, although I would like to see us move to “A” in
> the near future.  I have tested several browsers, and several OpenSSL
> versions, and they seem to work.  I’m bringing attention to this to
> mention that if people see issues in HTTPS in the next week or so, they
> are likely the result of this change, and to report them so we can get
> them resolved.  The most likely culprit is going to be out of date
> crypto frameworks (think pyCrypto type) that don’t have support for
> SHA256.  If we lose compatibility for anything important, we need to get
> it identified so we can roll back the changes, or get frameworks up to
> date.  In most cases, it will give a very unhelpful “Unable to make
> secure connection” or “No shared cipher suites” message, which is pretty
> cryptic if you don’t know what to look for.
> 
>  
> 
> Hopefully this goes off without a hitch, and this email was unnecessary,
> but in the case that I’ve made an error, hopefully this warning will
> save people some time.
> 
>  
> 
> -Ed
> 
