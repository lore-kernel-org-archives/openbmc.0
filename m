Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZtKk0fgHzDqMx
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 06:28:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 12:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,309,1549958400"; d="scan'208";a="220636744"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 04 Apr 2019 12:28:48 -0700
Subject: Re: Improvements required in bmcweb
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <d901219e-2736-d51a-7e33-bec28d43a310@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <5a1d0c06-755c-c1c5-90fb-bf1ba9f40269@intel.com>
Date: Thu, 4 Apr 2019 12:28:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d901219e-2736-d51a-7e33-bec28d43a310@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Thu, 04 Apr 2019 19:28:58 -0000

On 4/4/19 2:17 AM, Ratan Gupta wrote:
> Hi Ed,
> 
> I am putting my points here, I found some functionalities missing in
> current bmcweb code.

Great!  Glad to see someone doing a review of the existing functionality
for corners, and missing error handling.
> 
> 1.
> 
> As part of redfish specification we need to support multi property
> update and if one of the property update is successful
> then bmcweb need to send the 200 OK as well as the extended error info
> for the property where the implementation encounters the error.
> 
To add to this, this is how the specification defines PATCH commands.
POST is expected to return error codes for missing properties.

> Now in bmcweb we do the asio call one after other and pass the asynResp
> var in each property update and the
> response code gets filled by each update call which seems to me is buggy.
> 
> Eg:  In any resource doPatch() if I do multiple asio calls for property
> update
> 
>          doPatch
>          {     asio1(asynRep);
>               asio2(asynRep);
>               asio3(asynResp);
>          }
> 
> Suppose in the above eg my third asio call gets failed(asio3) due to
> D-Bus call failure,
> In that case asyncrep would have the internal server error(5XX), as per
> the spec the status code
> should have been 200 if one of the property update is successful.

Today, most of the redfish endpoint implementations define any dbus
error as an internal error.  In some cases, this makes sense for things
that aren't expected to fail.  In other cases, it doesn't make a lot of
sense, and we can do a better job posting errors to the user.  Internal
error is defined as a 500 error today, which is some of the conflict you
see here with PATCH.

> 
> My proposal is to introduce a var in the "crow::res" structure, which
> will be true if any property update is successful,
> and in the destructor of asyncRep(shared pointer around res) where we
> are calling the res.end(), we can check this var value,
> if it is true then we can update the status code to 200 OK.
> 
First off, I'm going to assume you meant crow::Response object defined here:
https://github.com/openbmc/bmcweb/blob/61adbda37aa63ae77585797587a7b4b6c3b61b25/crow/include/crow/http_response.h#L16

crow::res is not a struct that I'm aware of.

One thing I would recommend is to go to the git history, and look up the
things that have been attempted already to make this behavior better.
There was an attempt to improve the error handling in the AsyncResp
class.  Today it looks like this:
https://github.com/openbmc/bmcweb/blob/61adbda37aa63ae77585797587a7b4b6c3b61b25/redfish-core/include/node.hpp#L35

It turned out to be too many corner cases for the last person that
tried, so they rolled back the changes, so the behavior was at least
consistent for all endpoints.


> What is your view?
> 
> 2.
> 

I think the async error handling cases needs to be handled in the
AsyncResp class.  In the past this was done with a "set_error" method on
the AsyncResp class that would track reference counts and track error
status in a member variable that handled that case specifically.  This
was removed in the current master, because of some hard-to-solve bugs
with the implementation.  If you wanted to tackle those, I think it's a
solvable problem, just something that nobody has had a desire to spend a
lot of time on.  I think the first step in any endeavor to improve async
error handling is that we need to finish the work to make all users use
the AsyncResp class consistently.  Today we have:
bmcweb::AsyncResp
redfish::AsyncResp
redfish::SensorsAsyncResp

As well as a number of implementations that still use the reference
counting paradigm for Async responses.  We need to get this down to one
class (possibly 2, if Redfish requires specific behavior).

It should be noted, what you see on master is already improved from what
existed at one point where every async transaction got its own Response
type, and we've been slowly transitioning to more and more consistent
usages.

Next step, once all parallel async responses are using the same object
type, would be to implement a "smarter" version of what the sensor Async
response object does:
https://github.com/openbmc/bmcweb/blob/61adbda37aa63ae77585797587a7b4b6c3b61b25/redfish-core/lib/sensors.hpp#L61

In that case, it's clearing the response object before returning it, so
it doesn't return half-constructed data.  This still isn't quite
correct, but given that it's handling an internal error on a GET
interface, it was deemed to be good enough, as it should never happen in
practice.


> Currently in bmcweb we are not mapping the dbus error to the actual
> error code, any dbus failure leads to "Internal Server error" which is 5XX.
> Do we have some plan to map the D-bus error code to correct http code?

I would love to see the mapping improved for the cases that users care
about, and it is already be possible with how the error handling is
structured today.
Here's an example of Jason differentiating between "not found" and
"internal" error types from a dbus response.
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/16912/6/redfish-core/lib/pcie.hpp#110
This pattern would just need to be repeated for the cases we care about.

I'm happy to review any patches that you've got to solve some, or any of
the above.

> 
> 
> Regards
> Ratan Gupta                
> 
> 
> 
> 
