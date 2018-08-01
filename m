Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gfNX6PvvzF10S
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 02:47:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2018 09:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,432,1526367600"; d="scan'208";a="59652856"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2018 09:47:00 -0700
Subject: Re: SSL Certificate management proposal.
To: Jayanth Othayoth <ojayanth@gmail.com>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
 <CACkAXSrj1X+EkuUwbOQb3C+OCe_kSaN8zfvWdL32s0=_Ji248g@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <013a368e-8dfb-6ad2-2e3e-76b356051499@intel.com>
Date: Wed, 1 Aug 2018 09:48:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACkAXSrj1X+EkuUwbOQb3C+OCe_kSaN8zfvWdL32s0=_Ji248g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 01 Aug 2018 16:47:09 -0000

>  >
> Agree with your concern, but from the security standpoint transmitting 
> private key over network is not recommended.  Additionally a simplified 
> method also can be provided for customers who wants that.
I'm happy with both, and I understand the desire to not transmit private 
keys over the network, but this is how a lot of organizations are set up 
today.  In general, the private key is sent over TLS, during an initial 
provisioning phase, on an isolated subnet to reduce the risk.  I'm not 
saying the CSR approach isn't an improvement, but I think we will need 
to support both approaches, and I don't know of any BMC that supports 
the CSR approach, although I'm not very familiar with some of the high 
end enterprise BMCs feature set.  It might be supported.

>  >
>  > What does this mean exactly?  Encrypted disk backed by hardware
>  > security?  Is it just implying file system permissions?
> Storage method can be varied based on the implementation. Curenlty 
> looking at file system permissions.
Got it.

>  >
>  > >   * Activate process shall validate the new certificate against the
>  > >     private key and information in the CSR.
>  > You don't really define what the "activate process" is in this context.
>  > I suspect you're talking about a process designed for cert upload, but
>  > I'm not really sure given the context.
>  >
> Upload process just save the Signed certificate in a  BMC location and 
> "activation" will replace the curently used certificate in the secured 
> location and restart all the impacted services.
Why have these as two steps?  Why not just upload the key and apply it 
in one atomic action?  It seems like it would simplify the code quite a 
bit, and reduce the possibility of issues.

>  >
> As mentioned earlier  curently used certificate will be replaced only 
> after the successful activation. So there wont be any downtime during 
> CSR creation process.
If I'm following correctly, the CSR gets replaced, but not the 
certificate?  If so, I misunderstood your initial requirement.  This 
should be fine.

>  >
> User privilege level need to be discussed more.
Agreed.



All in all, sounds like a good start to me.
