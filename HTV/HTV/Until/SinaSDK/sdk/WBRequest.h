//
//  WBRequest.h
//  SinaWeiBoSDK
//  Based on OAuth 2.0
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  Copyright 2011 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kSinaWBRequestPostDataTypeNone,
	kSinaWBRequestPostDataTypeNormal,			// for normal data post, such as "user=name&password=psd"
	kSinaWBRequestPostDataTypeMultipart,        // for uploading images and files.
}SinaWBRequestPostDataType;


@class WBRequest;

@protocol SinaWBRequestDelegate <NSObject>

@optional

- (void)request:(WBRequest *)request didReceiveResponse:(NSURLResponse *)response;

- (void)request:(WBRequest *)request didReceiveRawData:(NSData *)data;

- (void)request:(WBRequest *)request didFailWithError:(NSError *)error;

- (void)request:(WBRequest *)request didFinishLoadingWithResult:(id)result;

@end

@interface WBRequest : NSObject
{
    NSString                *url;
    NSString                *httpMethod;
    NSDictionary            *params;
    SinaWBRequestPostDataType   postDataType;
    NSDictionary            *httpHeaderFields;
    
    NSURLConnection         *connection;
    NSMutableData           *responseData;
    
    id<SinaWBRequestDelegate>   delegate;
}

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *httpMethod;
@property (nonatomic, retain) NSDictionary *params;
@property SinaWBRequestPostDataType postDataType;
@property (nonatomic, retain) NSDictionary *httpHeaderFields;
@property (nonatomic, assign) id<SinaWBRequestDelegate> delegate;

+ (WBRequest *)requestWithURL:(NSString *)url 
                   httpMethod:(NSString *)httpMethod 
                       params:(NSDictionary *)params
                 postDataType:(SinaWBRequestPostDataType)postDataType
             httpHeaderFields:(NSDictionary *)httpHeaderFields
                     delegate:(id<SinaWBRequestDelegate>)delegate;

+ (WBRequest *)requestWithAccessToken:(NSString *)accessToken
                                  url:(NSString *)url
                           httpMethod:(NSString *)httpMethod 
                               params:(NSDictionary *)params
                         postDataType:(SinaWBRequestPostDataType)postDataType
                     httpHeaderFields:(NSDictionary *)httpHeaderFields
                             delegate:(id<SinaWBRequestDelegate>)delegate;

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params httpMethod:(NSString *)httpMethod;

- (void)connect;
- (void)disconnect;

@end
