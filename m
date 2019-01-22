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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kkWM5fMszDqKX
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 10:04:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 15:04:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,508,1539673200"; d="scan'208";a="313936684"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jan 2019 15:04:08 -0800
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Ed Tanous <ed.tanous@intel.com>
Subject: MTLS support for HTTPS authentication
Message-ID: <d408ea9c-6088-7e4e-f124-0de2e8fe51bb@intel.com>
Date: Tue, 22 Jan 2019 15:06:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 22 Jan 2019 23:04:16 -0000

I'm investigating the possibility of the web layer in OpenBMC supporting
MTLS for user authentication.  For the uninitiated, mutual TLS is a
mechanism to allow a server to verify whether or not a client can be
"trusted" in a very similar way that the client can verify that the
server is trusted on a standard TLS connection.  This is done during the
setup of the transport, rather than inside the channel once the
transport has been opened.  It also allows users to authenticate without
having any direct credentials (encrypted or not) to hit the wire.  The
hope is that this would allow much easier and more secure use of the
webui, Redfish, and any other https based resource in the BMC.

Overall, the primary goal here is to provide an authentication mechanism
that doesn't require passwords, nor requires the BMC to know any
"secrets" like session tokens, and could authenticate entirely based on
"public" information, thus reducing the possibility for attack.


The flow I'd like to propose is.

1. During provisioning of a system, an administrator uploads the public
certificate for an authority that can be trusted for user
authentication.  This would likely be done through a POST/PATCH to the
new Redfish Certificates schema that was recently released.  At this
point, the administrator/provisioner would have the option of completely
disabling other authentication types (session, basic, ect) to allow ONLY
authenticated types.  For images or deployments that have a known
destination, and known authority, these authorities could be baked into
the image at build time instead of uploaded runtime.  The "phosphor"
reference implementation would default to allowing no authorities until
configured.

2. A user would request a signed certificate (using a CSR) to their
given authority.  This could be as simple as signing a request locally
using openssl, or requesting a cert from a rack level controller
(possibly OpenRMC?).   The exact flows would depend on the authority
being used, and should be considered outside the scope of OpenBMC.  The
CSR would include the CommonName field value of <username>@<bmc
hostname>   (ex ed@EdsBmc).

3. A user would then attach that certificate to their request.  Doing
this in curl would use the --key and --cert parameters.  Most HTTP
clients have similar mechanisms for specifying a client certificate.

4. Upon receiving the connection, the bmc would verify that the
certificate was valid against the certificate authority, then use the
CommonName field to parse out the username, and match it up with a given
BMC user.  That connection would then be authenticated as that that user
until the connection is closed.  The authorization schemes would remain
as they were previously.


Some questions I'd like to pose:

1. Is there something better we can use in the CommonName field to
correctly identify the system name and the user name?  Do we think that
the common authority services people are using will allow signing such a
request?  Is the request detailed enough?
2. How should we handle the date problem?  In a lot of cases, the BMC
might not have access to the current or correct time.  This will cause
validation of the certificate to fail, as in most cases it will have
been signed in the "future" compared to the BMC time.  Should we ignore
the signing dates?  Is there a way to verify we're on NTP time, then
fall back to ignoring the date if NTP is disabled or has failed?  Should
we be strict?  Does this need to be configurable?
3. Should we limit the number of levels of verification we support?
Said another way, should we support anything other than a certificate
chain size of 1?  Should we support configuration of the chain length?
Is there some upper bound we should impose?
4. Is anyone else interested in pursuing?


-Ed
