Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4415Kp4p2szDqRL
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 19:00:46 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1F7xBbL013878
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 03:00:44 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qnpqyfs7x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 03:00:43 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 15 Feb 2019 08:00:41 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Feb 2019 08:00:40 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1F80dOM786798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Feb 2019 08:00:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E21E11C05B;
 Fri, 15 Feb 2019 08:00:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB82D11C066;
 Fri, 15 Feb 2019 08:00:36 +0000 (GMT)
Received: from [9.80.208.2] (unknown [9.80.208.2])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Feb 2019 08:00:36 +0000 (GMT)
Subject: Re: Redfish: Generating and installing CSR based certificates.
To: Jayanth Othayoth <ojayanth@gmail.com>
Cc: openbmc@lists.ozlabs.org
References: <CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com>
 <827200f4-1c4f-9619-1037-26473a9b81e1@linux.vnet.ibm.com>
 <CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 15 Feb 2019 13:30:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1FE524373DC72CE1E889DBEF"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021508-0008-0000-0000-000002C0C3A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021508-0009-0000-0000-0000222CE8D7
Message-Id: <c5b8cc99-92af-f7b3-378f-0aaf32fd1ece@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902150060
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
X-List-Received-Date: Fri, 15 Feb 2019 08:00:47 -0000

This is a multi-part message in MIME format.
--------------1FE524373DC72CE1E889DBEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jayanth,

On 15/02/19 10:52 AM, Jayanth Othayoth wrote:
>
>
> On Fri, Feb 15, 2019 at 9:54 AM Ratan Gupta 
> <ratagupt@linux.vnet.ibm.com <mailto:ratagupt@linux.vnet.ibm.com>> wrote:
>
>     Hi Jayanth,
>
>     I have some querys
>
>     On 14/02/19 7:23 PM, Jayanth Othayoth wrote:
>>     All,
>>     Please find the Redflish based CSR ( Certificate Signing Request)
>>     generation and installing the certificate in BMC.
>>     This is based on the latest Redfish spec (Reference:
>>     https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf)
>>     and related documents.
>>     Included the Gerrit link related to  d-bus interfaces :
>>         Review Link:
>>     https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/
>>
>>     Looking for the inputs  on this  design flow and any additional
>>     changes required from the security aspect on managing private
>>     keys in the BMC.
>>
>>       * The user performs the GenerateCSR action ( URIs:
>>         /redfish/v1/CertificateService ) with required parameters.
>>           o Certificate service provides a d-bus interface to
>>             generate CSR .
>>               + Certificate manager create Private key and saves the
>>                 service specific path
>>               + Returns the d-bus path for the newly created CSR.
>>
>     I am hoping this design is wrt Redfish, which explains the flow to
>     deploy CSR based certificate.
>
>     I was little confused about d-bus interface terminology here, I
>     understand that in redfish we have certificate service schema
>     which has action
>
>     GenerateCSR, I am assuming we are talking about the same.
>
>     GenerateCSR should not return the d-bus Path however it should
>     return the URI of the Certificate Collection where the certificate
>     will be installed.
>
> @ratan Certificate manager design is services ( HTTPS Server, LDAP 
> client etc) . we don't need to get collection object based uri here 
> because BMC web is running from collection object context . The  d-bus 
> object uri  mentioned here , just used to watch CSR is ready and 
> return info to redfish user.
I didn't follow that "certificate manager design is services".

I don't understand why implementation doesn't need to get the collection 
based uri.

GenerateCSR returns the the URI of the Certificate Collection where the 
certificate will be installed.

So the response which you get from the GenerateCSR, that would be used 
to POST the next request which will create a certificate resource.

What do you mean by "BMC web is running from collection object context 
"? I don't follow it.

What info you would send as part of GenerateCSR request, for that we 
need to adhere with the standard, and the standard says that it would 
be  the CSR string and
the URI of the Certificate Collection wherethe certificate will be 
installed(as per the schema definition)

>
>     Does the GenerateCSR creates CSR resource which can be modifiable
>     in future?
>
>>           o  Certificate service provides d-bus interface to download CSR
>>               +  The user need need wait for the creation of CSR
>>                 specific d-bus path to download the newly created CSR
>>
>     Does the certificate service schema have the action Download CSR?
>
> -No ,  Redfish GenerateCSR methods expect CSR text as output.
>
>     I hope that response of GenerateCSR returns the CSR, There should
>     not be another redfish call to get the CSR.
>
> - Single call from Redfish point.
>
>>           o  The user takes the CSR file and get it signed by the
>>             appropriate authority.
>>               +  This step is outside the scope of Redfish.
>>       *  The user navigates to the appropriate certificate collection
>>           o   Example: if trying to replace the HTTPS certificate for
>>             a Manager, navigate to the Manager’s Certificate
>>             Collection that is subordinate to the
>>             NetworkProtocol/HTTPS object
>>       * The user performs a POST on the Certificate Collection with
>>         the certificate string in the body
>>           o  Use the existing certificate upload d-bus interface.
>>       * Certificate manager validates the certificate with the
>>         available service specific private keys in the BMC.
>>       * After successful validation  pairs the private key used in
>>         the first step with the installed certificate.
>>
>     Would the implementation persist the CSR and associated private
>     key for verification?
>
> - yes.
>
>     I can understand that we can do the verification of public/private
>     key through oprenssl function, but is there a possibility that
>     user can change the CSR request(eg change the organization)
>
>  Redfish doesn't support this now , Any real use case for this?

How you would validate the Certificate with the CSR(which is persisted 
on the BMC).

CSR have the subject and other info and the public key.If user changes 
the subject info but doesn't change the public key,Can we verify that?

>     and get it signed and upload the certificate, How the
>     implementation takes care of it?
>
>     Now suppose user creates three CSR request and on the BMC we have
>     three associated private keys and once user upload the certificate
>
>     would the implementation starts matching the certificate public
>     key with all the stored private keys and once it gets matched
>
>     then the implementation creates the pairing?
>
>     How the certificates would be deleted?
>
>
> redfish supports only certificate replace. no delete ,
> Planing to check with redfish community on this , this feature will be 
> useful for Authority type certificates.
>
>
>>     Assumption:
>>
>>       * For a service, BMC allows maximum 3 ( ?) CSR requests. Any
>>         new request after this will remove the oldest private key
>>         information from the BMC.
>>       * User has to do a Factory removing  the private key from the
>>         system.
>>
>     Regards
>
>     Ratan Gupta
>

--------------1FE524373DC72CE1E889DBEF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jayanth,<br>
    </p>
    <div class="moz-cite-prefix">On 15/02/19 10:52 AM, Jayanth Othayoth
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Feb 15, 2019 at 9:54
            AM Ratan Gupta &lt;<a
              href="mailto:ratagupt@linux.vnet.ibm.com"
              moz-do-not-send="true">ratagupt@linux.vnet.ibm.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p>Hi Jayanth,</p>
              <p>I have some querys<br>
              </p>
              <div class="gmail-m_-4306834406775087264moz-cite-prefix">On
                14/02/19 7:23 PM, Jayanth Othayoth wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div dir="ltr">
                      <div>All,</div>
                      <div>Please find the Redflish based CSR (
                        Certificate Signing Request) generation and
                        installing the certificate in BMC. <br>
                      </div>
                      <div>This is based on the latest Redfish spec
                        (Reference: <a
href="https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf"
                          target="_blank" moz-do-not-send="true">https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pdf</a>)
                        and related documents. <br>
                      </div>
                      <div>Included the Gerrit link related to  d-bus
                        interfaces : <br>
                      </div>
                      <div>    Review Link: <a
href="https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/"
                          target="_blank" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/</a></div>
                      <div><br>
                      </div>
                      <div>Looking for the inputs  on this  design flow
                        and any additional changes required from the
                        security aspect on managing private keys in the
                        BMC. <br>
                      </div>
                      <div>
                        <ul>
                          <li>The user performs the GenerateCSR action (
                            URIs: /redfish/v1/CertificateService ) with
                            required parameters.</li>
                          <ul>
                            <li>Certificate service provides a d-bus
                              interface to generate CSR .</li>
                            <ul>
                              <li>Certificate manager create Private key
                                and saves the service specific path <br>
                              </li>
                              <li>Returns the d-bus path for the newly
                                created CSR.</li>
                            </ul>
                          </ul>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p><tt>I am hoping this design is wrt Redfish, which
                  explains the flow to deploy CSR based certificate.</tt></p>
              <p><tt>I was little confused about d-bus interface
                  terminology here, I understand that in redfish we have
                  certificate service schema which has action</tt></p>
              <p><tt>GenerateCSR, I am assuming we are talking about the
                  same.</tt><br>
              </p>
              <p><tt>GenerateCSR should not return the d-bus Path
                  however it should return the </tt><tt><span><span
                      class="gmail-m_-4306834406775087264objectBox
                      gmail-m_-4306834406775087264objectBox-string"> URI
                      of the Certificate Collection where the
                      certificate will be installed.</span></span></tt></p>
            </div>
          </blockquote>
          <div>@ratan Certificate manager design is services ( HTTPS
            Server, LDAP client etc) . we don't need to get collection
            object based uri here because BMC web is running from
            collection object context . The  d-bus object uri  mentioned
            here , just used to watch CSR is ready and return info to
            redfish user.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <tt>I didn't follow that "certificate manager design is services".</tt><br>
    <p><tt>I don't understand why implementation doesn't need to get the
        collection based uri.</tt><br>
    </p>
    <p><tt>GenerateCSR returns the the </tt><tt><span><span
            class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string"> URI of the
            Certificate Collection where the certificate will be
            installed.</span></span></tt></p>
    <p><tt><span><span class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string">So the
            response which you get from the GenerateCSR, that would be
            used to POST the next request which will create a
            certificate resource.<br>
          </span></span></tt></p>
    <p><tt><span><span class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string">What do you
            mean by "</span></span></tt><tt><span><span
            class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string">BMC web is
            running from collection object context "? I don't follow it.</span></span></tt></p>
    <p><tt><span><span class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string">What info you
            would send as part of GenerateCSR request, for that we need
            to adhere with the standard, and the standard says that it
            would be  the CSR string and </span></span></tt><br>
      <tt><span><span class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string"><tt>the </tt><tt><span><span
                  class="gmail-m_-4306834406775087264objectBox
                  gmail-m_-4306834406775087264objectBox-string"> URI of
                  the Certificate Collection where</span></span></tt></span></span></tt><tt><span><span
            class="gmail-m_-4306834406775087264objectBox
            gmail-m_-4306834406775087264objectBox-string"><tt><span><span
                  class="gmail-m_-4306834406775087264objectBox
                  gmail-m_-4306834406775087264objectBox-string"><span><span
                      class="objectBox objectBox-string"> the
                      certificate will be installed(as per the schema
                      definition)</span></span></span></span></tt></span></span></tt></p>
    <blockquote type="cite"
cite="mid:CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p><tt>Does the GenerateCSR creates CSR resource which can
                  be modifiable in future?<br>
                </tt></p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div dir="ltr">
                      <div>
                        <ul>
                          <ul>
                            <li> Certificate service provides d-bus
                              interface to download CSR</li>
                            <ul>
                              <li> The user need need wait for the
                                creation of CSR specific d-bus path to
                                download the newly created CSR</li>
                            </ul>
                          </ul>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p><tt>Does the certificate service schema have the action
                  Download CSR?</tt></p>
            </div>
          </blockquote>
          <div>-No ,  Redfish GenerateCSR methods expect CSR text as
            output.<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p><tt>I hope that response of GenerateCSR returns the
                  CSR, There should not be another redfish call to get
                  the CSR</tt>.<br>
              </p>
            </div>
          </blockquote>
          <div>- Single call from Redfish point. <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p> </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div dir="ltr">
                      <div>
                        <ul>
                          <ul>
                            <li> The user takes the CSR file and get it
                              signed by the appropriate authority.</li>
                            <ul>
                              <li> This step is outside the scope of
                                Redfish.</li>
                            </ul>
                          </ul>
                          <li> The user navigates to the appropriate
                            certificate collection</li>
                          <ul>
                            <li>  Example: if trying to replace the
                              HTTPS certificate for a Manager, navigate
                              to the Manager’s Certificate Collection
                              that is subordinate to the  
                              NetworkProtocol/HTTPS object</li>
                          </ul>
                          <li>The user performs a POST on the
                            Certificate Collection with the certificate
                            string in the body</li>
                          <ul>
                            <li> Use the existing certificate upload
                              d-bus interface.</li>
                          </ul>
                          <li>Certificate manager validates the
                            certificate with the available service
                            specific private keys in the BMC.</li>
                          <li>After successful validation  pairs the
                            private key used in the first step with the
                            installed certificate.</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p><tt>Would the implementation persist the CSR and
                  associated private key for verification?</tt></p>
            </div>
          </blockquote>
          <div>- yes.<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p><tt>I can understand that we can do the verification of
                  public/private key through oprenssl function, but is
                  there a possibility that user can change the CSR
                  request(eg change the organization)</tt></p>
            </div>
          </blockquote>
          <div> Redfish doesn't support this now , Any real use case for
            this?<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>How you would validate the Certificate with the CSR(which is
        persisted on the BMC).</tt></p>
    <p><tt>CSR have the subject and other info and the public key.If
        user changes the subject info but doesn't change the public
        key,Can we verify that? </tt><br>
    </p>
    <blockquote type="cite"
cite="mid:CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p><tt>and get it signed and upload the certificate, How
                  the implementation takes care of it?</tt></p>
              <p><tt>Now suppose user creates three CSR request and on
                  the BMC we have three associated private keys and once
                  user upload the certificate</tt></p>
              <p><tt>would the implementation starts matching the
                  certificate public key with all the stored private
                  keys and once it gets matched</tt></p>
              <p><tt>then the implementation creates the pairing?</tt><br>
              </p>
              <tt>How the certificates would be deleted?</tt></div>
          </blockquote>
          <div><br>
          </div>
          <div>redfish supports only certificate replace. no delete , <br>
          </div>
          <div>Planing to check with redfish community on this , this
            feature will be useful for Authority type certificates.  <br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF"><br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr">
                    <div dir="ltr">
                      <div>Assumption:<br>
                      </div>
                      <ul>
                        <li>For a service, BMC allows maximum 3 ( ?) CSR
                          requests. Any new request after this will
                          remove the oldest private key information from
                          the BMC.</li>
                        <li>User has to do a Factory removing  the
                          private key from the system.</li>
                      </ul>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p><tt>Regards</tt></p>
              <p><tt>Ratan Gupta</tt><br>
              </p>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------1FE524373DC72CE1E889DBEF--
