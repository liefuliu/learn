// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Class.pb.h"
// @@protoc_insertion_point(imports)

@implementation ClassRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ClassRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = registry;
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface ClassInfo ()
@property (strong) NSString* project;
@property SInt32 price;
@property (strong) NSString* teacher;
@property SInt32 id;
@end

@implementation ClassInfo

- (BOOL) hasProject {
  return !!hasProject_;
}
- (void) setHasProject:(BOOL) _value_ {
  hasProject_ = !!_value_;
}
@synthesize project;
- (BOOL) hasPrice {
  return !!hasPrice_;
}
- (void) setHasPrice:(BOOL) _value_ {
  hasPrice_ = !!_value_;
}
@synthesize price;
- (BOOL) hasTeacher {
  return !!hasTeacher_;
}
- (void) setHasTeacher:(BOOL) _value_ {
  hasTeacher_ = !!_value_;
}
@synthesize teacher;
- (BOOL) hasId {
  return !!hasId_;
}
- (void) setHasId:(BOOL) _value_ {
  hasId_ = !!_value_;
}
@synthesize id;
- (instancetype) init {
  if ((self = [super init])) {
    self.project = @"";
    self.price = 0;
    self.teacher = @"";
    self.id = 0;
  }
  return self;
}
static ClassInfo* defaultClassInfoInstance = nil;
+ (void) initialize {
  if (self == [ClassInfo class]) {
    defaultClassInfoInstance = [[ClassInfo alloc] init];
  }
}
+ (instancetype) defaultInstance {
  return defaultClassInfoInstance;
}
- (instancetype) defaultInstance {
  return defaultClassInfoInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasProject) {
    [output writeString:1 value:self.project];
  }
  if (self.hasPrice) {
    [output writeInt32:2 value:self.price];
  }
  if (self.hasTeacher) {
    [output writeString:3 value:self.teacher];
  }
  if (self.hasId) {
    [output writeInt32:4 value:self.id];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (SInt32) serializedSize {
  __block SInt32 size_ = memoizedSerializedSize;
  if (size_ != -1) {
    return size_;
  }

  size_ = 0;
  if (self.hasProject) {
    size_ += computeStringSize(1, self.project);
  }
  if (self.hasPrice) {
    size_ += computeInt32Size(2, self.price);
  }
  if (self.hasTeacher) {
    size_ += computeStringSize(3, self.teacher);
  }
  if (self.hasId) {
    size_ += computeInt32Size(4, self.id);
  }
  size_ += self.unknownFields.serializedSize;
  memoizedSerializedSize = size_;
  return size_;
}
+ (ClassInfo*) parseFromData:(NSData*) data {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromData:data] build];
}
+ (ClassInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (ClassInfo*) parseFromInputStream:(NSInputStream*) input {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromInputStream:input] build];
}
+ (ClassInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ClassInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromCodedInputStream:input] build];
}
+ (ClassInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ClassInfo*)[[[ClassInfo builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ClassInfoBuilder*) builder {
  return [[ClassInfoBuilder alloc] init];
}
+ (ClassInfoBuilder*) builderWithPrototype:(ClassInfo*) prototype {
  return [[ClassInfo builder] mergeFrom:prototype];
}
- (ClassInfoBuilder*) builder {
  return [ClassInfo builder];
}
- (ClassInfoBuilder*) toBuilder {
  return [ClassInfo builderWithPrototype:self];
}
- (void) writeDescriptionTo:(NSMutableString*) output withIndent:(NSString*) indent {
  if (self.hasProject) {
    [output appendFormat:@"%@%@: %@\n", indent, @"project", self.project];
  }
  if (self.hasPrice) {
    [output appendFormat:@"%@%@: %@\n", indent, @"price", [NSNumber numberWithInteger:self.price]];
  }
  if (self.hasTeacher) {
    [output appendFormat:@"%@%@: %@\n", indent, @"teacher", self.teacher];
  }
  if (self.hasId) {
    [output appendFormat:@"%@%@: %@\n", indent, @"id", [NSNumber numberWithInteger:self.id]];
  }
  [self.unknownFields writeDescriptionTo:output withIndent:indent];
}
- (void) storeInDictionary:(NSMutableDictionary *)dictionary {
  if (self.hasProject) {
    [dictionary setObject: self.project forKey: @"project"];
  }
  if (self.hasPrice) {
    [dictionary setObject: [NSNumber numberWithInteger:self.price] forKey: @"price"];
  }
  if (self.hasTeacher) {
    [dictionary setObject: self.teacher forKey: @"teacher"];
  }
  if (self.hasId) {
    [dictionary setObject: [NSNumber numberWithInteger:self.id] forKey: @"id"];
  }
  [self.unknownFields storeInDictionary:dictionary];
}
- (BOOL) isEqual:(id)other {
  if (other == self) {
    return YES;
  }
  if (![other isKindOfClass:[ClassInfo class]]) {
    return NO;
  }
  ClassInfo *otherMessage = other;
  return
      self.hasProject == otherMessage.hasProject &&
      (!self.hasProject || [self.project isEqual:otherMessage.project]) &&
      self.hasPrice == otherMessage.hasPrice &&
      (!self.hasPrice || self.price == otherMessage.price) &&
      self.hasTeacher == otherMessage.hasTeacher &&
      (!self.hasTeacher || [self.teacher isEqual:otherMessage.teacher]) &&
      self.hasId == otherMessage.hasId &&
      (!self.hasId || self.id == otherMessage.id) &&
      (self.unknownFields == otherMessage.unknownFields || (self.unknownFields != nil && [self.unknownFields isEqual:otherMessage.unknownFields]));
}
- (NSUInteger) hash {
  __block NSUInteger hashCode = 7;
  if (self.hasProject) {
    hashCode = hashCode * 31 + [self.project hash];
  }
  if (self.hasPrice) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.price] hash];
  }
  if (self.hasTeacher) {
    hashCode = hashCode * 31 + [self.teacher hash];
  }
  if (self.hasId) {
    hashCode = hashCode * 31 + [[NSNumber numberWithInteger:self.id] hash];
  }
  hashCode = hashCode * 31 + [self.unknownFields hash];
  return hashCode;
}
@end

@interface ClassInfoBuilder()
@property (strong) ClassInfo* resultClassInfo;
@end

@implementation ClassInfoBuilder
@synthesize resultClassInfo;
- (instancetype) init {
  if ((self = [super init])) {
    self.resultClassInfo = [[ClassInfo alloc] init];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return resultClassInfo;
}
- (ClassInfoBuilder*) clear {
  self.resultClassInfo = [[ClassInfo alloc] init];
  return self;
}
- (ClassInfoBuilder*) clone {
  return [ClassInfo builderWithPrototype:resultClassInfo];
}
- (ClassInfo*) defaultInstance {
  return [ClassInfo defaultInstance];
}
- (ClassInfo*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (ClassInfo*) buildPartial {
  ClassInfo* returnMe = resultClassInfo;
  self.resultClassInfo = nil;
  return returnMe;
}
- (ClassInfoBuilder*) mergeFrom:(ClassInfo*) other {
  if (other == [ClassInfo defaultInstance]) {
    return self;
  }
  if (other.hasProject) {
    [self setProject:other.project];
  }
  if (other.hasPrice) {
    [self setPrice:other.price];
  }
  if (other.hasTeacher) {
    [self setTeacher:other.teacher];
  }
  if (other.hasId) {
    [self setId:other.id];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (ClassInfoBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (ClassInfoBuilder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSetBuilder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    SInt32 tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setProject:[input readString]];
        break;
      }
      case 16: {
        [self setPrice:[input readInt32]];
        break;
      }
      case 26: {
        [self setTeacher:[input readString]];
        break;
      }
      case 32: {
        [self setId:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasProject {
  return resultClassInfo.hasProject;
}
- (NSString*) project {
  return resultClassInfo.project;
}
- (ClassInfoBuilder*) setProject:(NSString*) value {
  resultClassInfo.hasProject = YES;
  resultClassInfo.project = value;
  return self;
}
- (ClassInfoBuilder*) clearProject {
  resultClassInfo.hasProject = NO;
  resultClassInfo.project = @"";
  return self;
}
- (BOOL) hasPrice {
  return resultClassInfo.hasPrice;
}
- (SInt32) price {
  return resultClassInfo.price;
}
- (ClassInfoBuilder*) setPrice:(SInt32) value {
  resultClassInfo.hasPrice = YES;
  resultClassInfo.price = value;
  return self;
}
- (ClassInfoBuilder*) clearPrice {
  resultClassInfo.hasPrice = NO;
  resultClassInfo.price = 0;
  return self;
}
- (BOOL) hasTeacher {
  return resultClassInfo.hasTeacher;
}
- (NSString*) teacher {
  return resultClassInfo.teacher;
}
- (ClassInfoBuilder*) setTeacher:(NSString*) value {
  resultClassInfo.hasTeacher = YES;
  resultClassInfo.teacher = value;
  return self;
}
- (ClassInfoBuilder*) clearTeacher {
  resultClassInfo.hasTeacher = NO;
  resultClassInfo.teacher = @"";
  return self;
}
- (BOOL) hasId {
  return resultClassInfo.hasId;
}
- (SInt32) id {
  return resultClassInfo.id;
}
- (ClassInfoBuilder*) setId:(SInt32) value {
  resultClassInfo.hasId = YES;
  resultClassInfo.id = value;
  return self;
}
- (ClassInfoBuilder*) clearId {
  resultClassInfo.hasId = NO;
  resultClassInfo.id = 0;
  return self;
}
@end


// @@protoc_insertion_point(global_scope)
