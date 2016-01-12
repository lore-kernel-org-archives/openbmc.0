Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8D4101A06BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 16:45:25 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 22:45:23 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 22:45:20 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 6E7801FF0046
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 22:33:30 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C5jJV121889166
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 22:45:20 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C5jJd1003569
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 22:45:19 -0700
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.230])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C5jBMV002996; Mon, 11 Jan 2016 22:45:19 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 2748B22B7CFE; Tue, 12 Jan 2016 16:45:09 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v7] Add get/set ipmid command support
 with correct DBUS property handling.
In-Reply-To: <1452559839-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452559839-27825-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 16:45:09 +1100
Message-ID: <87d1t7cpwa.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011205-0005-0000-0000-00001B5A92EB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 05:45:26 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> 1) Add support for IPMI get/set boot option command.
>     a) boot options stored in dbus property.
>     b) IPMI get boot option command get boot option from the dbus
>     property.
>     c) IPMI set boot option coomand set boot option to the dbus
>     property.
> 2) Two methods to handle the dbus property set and get:
>     a) dbus_set_property()
>     b) dbus_get_property()
> 3) The property is stored as a 10 character strings which representsd 5-byte information.
> 4) ipmid set method is registered and implemented since petitboot will use it to clear the boot options.
> 5) Get service name via object mapper
>     a) The connection name is got via objectmapper.
>     b) The method used to get the connection name is object_mapper_get_connection().
>     c) dbus_get_property/dbus_set_property will get the connection name via the above method instead of hard coding.
> 6) Error code are properly handled.
> 7) Use sprinf/sscanf for int/string conversion.
>     a) Instead of reinventing the wheel by defining methods converting int to string, use sprintf/sscanf should be a more clean and robust way.
> 8) Fix issues addressed by the community.
>     a) change malloc heap to stack local variable.
>     b) Fix multi line comment style from "//" to "/**/".
>     c) Add defines for return codes.
>     d) Add more comments.

Please read https://www.kernel.org/doc/Documentation/SubmittingPatches
sections 2, 3, 6, 8, 9, 11, 12, 13, 14 and 15 - which all generally
apply to most projects, and certainly are what others who've reviewed
this series (along with myself) look for.

-- 
Stewart Smith
OPAL Architect, IBM.
