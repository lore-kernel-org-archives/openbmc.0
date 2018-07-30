Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fRXL6qYMzF0gv
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 03:34:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2018 10:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,422,1526367600"; d="scan'208";a="61001948"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 30 Jul 2018 10:34:37 -0700
Subject: Re: Phosphor Web-ui: Server unreachable
To: openbmc@lists.ozlabs.org
References: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
Date: Mon, 30 Jul 2018 10:36:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 30 Jul 2018 17:34:43 -0000

On 07/30/2018 05:04 AM, AKASH G J wrote:
> Hi Team,
> 
> I added phosphor-webui into the Linux image and set up client side of 
> the web interface. In the client side of web interface I could able to 
> give the IP address, username and password. After entering all those 
> details, it is showing "server unreachable". But I could able to ping 
> the server board and ssh into the system. Please someone help to resolve 
> the problem.
> 
> 
> 
> Thanks and Regards,
> 
> Akash G J

We need some basic information to help you troubleshoot.  You might also 
find faster responses on irc;  Most of the people involved in the web 
infrastructure are online there.

1. What platform are you using?
2. If not one of the upstream platforms, which web server is your 
platform using?  (probably one of phosphor-rest, bmcweb, or 
phosphor-rest+nginx)
3. When you open up the debugger window in your chosen browser (usually 
the F12 key) then go to the network tab and attempt to log in, what do 
you see?  You should see an attempt to get to the /login url, with some 
kind of error code (maybe 401, maybe 500, maybe something else).  We'll 
need that to help troubleshoot.
4. Is there anything else strange about your setup that you might think 
would contribute to your issue?
5. Are you hosting phosphor-webui from a different machine from the BMC. 
  Depending on what server you are using, there are likely security 
settings preventing cross site scripting that are blocking you.
