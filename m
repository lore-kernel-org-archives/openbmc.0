Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NCGv51fkzDqHV
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 21:34:31 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 18 Mar 2019 06:35:04 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: API authentication
Message-ID: <20190318103504.zcfgdmgqfhi63jte@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
X-List-Received-Date: Mon, 18 Mar 2019 10:34:32 -0000

I am looking for ideas on how to implement a mechanism to restrict access to
specific methods of a service/API (e.g. Redfish).

This would be orthogonal to role-based authorization - e.g. the authorization
would be provided by someone other than the system administrator - e.g. the
system manufacturer.

I think I want OAuth for this with these definitions:

resource owner: system manufacturer
client: any user of the API (could be application specific but not required)
resource: data flowing over the API being authorized

Could the system manufacturer authorize clients on non-internet connected BMCs?

Is there a better way to go about this?

Does anyone have any experience with something like this?  I would love to be
pointed to further reading, code, or just your thoughts in general.

thx - Brad
